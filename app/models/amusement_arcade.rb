class AmusementArcade < ApplicationRecord
  belongs_to :prefecture

  before_validation :set_prefecture
  validates :prefecture_id, presence: true

  after_validation :geocode

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=" + ENV['GCP_API_KEY'])
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    if response["status"] == 'OK'
      self.latitude = response["results"][0]["geometry"]["location"]["lat"]
      self.longitude = response["results"][0]["geometry"]["location"]["lng"]
    else
      self.latitude = 0
      self.longitude = 0
    end
  end

  def set_prefecture
    self.prefecture_id = nil
    prefecture_name = self.address.match(/.*[都道府県]/)
    if prefecture_name
      prefecture = Prefecture.find_by(name: prefecture_name[0])
      self.prefecture_id = prefecture.id
    end
  end
end
