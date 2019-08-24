class AmusementArcade < ApplicationRecord
  belongs_to :prefecture, optional: true
  has_many :iidx, :dependent => :nullify
  has_many :amusement_arcade_shop_tags
  has_many :shop_tags, through: :amusement_arcade_shop_tags
  accepts_nested_attributes_for :shop_tags, allow_destroy: true

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :address, presence: true
  regex = URI.regexp(['http', 'https'])
  validates :homepage_url, length: { maximum: 120 }, format: { with: regex }, allow_blank: true
  validates :twitter_url, length: { maximum: 120 }, format: { with: regex }, allow_blank: true

  after_validation :geocode, :set_prefecture

  def self.search(params)
    prefecture_id =  params[:search][:prefecture_id].present? ? params[:search][:prefecture_id] : 23
    result = AmusementArcade.all
        .joins(:prefecture)
        .merge(Prefecture.where(id: prefecture_id)) # TODO: AmusementArcadeのscopeにうつす
        .then{|result|
            shop_tags = params[:search][:shop_tag_ids]
            if shop_tags.present?
                result.includes(:shop_tags)
                .where(amusement_arcade_shop_tags: {shop_tag_id: shop_tags.map(&:to_i)})
            else
                result.all
            end
        }
    result
  end

  private
  def geocode
    self.latitude = 0
    self.longitude = 0

    return if self.address == nil

    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=" + ENV['GCP_API_KEY'])
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    if response["status"] == 'OK'
      self.latitude = response["results"][0]["geometry"]["location"]["lat"]
      self.longitude = response["results"][0]["geometry"]["location"]["lng"]
    end
  end

  def set_prefecture
    self.prefecture_id = nil

    return if self.address == nil

    prefecture_name = self.address.match(/.*[都道府県]/)
    if prefecture_name
      prefecture = Prefecture.find_by(name: prefecture_name[0])
      self.prefecture_id = prefecture.id
    end
  end
end
