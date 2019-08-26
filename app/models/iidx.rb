class Iidx < ApplicationRecord
    belongs_to :amusement_arcade
    has_many :iidx_machine_tags
    has_many :machine_tags, through: :iidx_machine_tags
    accepts_nested_attributes_for :machine_tags, allow_destroy: true

    validates :serial_no, length: { is: 12 }, format: { with: /\A[a-zA-Z]{6}\d{6}\z/, message: "シリアルは半角アルファベット6文字と半角数値6文字となります" }, allow_nil: true, allow_blank: true
    validates :spring_weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_nil: true
    validates :switch_weight, numericality: { greater_than_or_equal_to: 0.00, less_than_or_equal_to: 1.00}, allow_nil: true
    validates :cash_price, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000}, presence: true
    validates :paseli_availability, inclusion: { in: [true, false] }
    validates :paseli_price, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :premium_free_time_from, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }, allow_nil: true
    validates :premium_free_time_to, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }, allow_nil: true

    def self.search(params)
        prefecture_id =  params[:search][:prefecture_id].present? ? params[:search][:prefecture_id] : 23 # TODO: magicnumber
        result = Iidx.all
            .joins(amusement_arcade: :prefecture)
            .merge(Prefecture.where(id: prefecture_id)) # TODO: AmusementArcadeのscopeにうつす
            .then{|result|
                if params[:search][:machine_tag_ids].present?
                    result.includes(:iidx_machine_tags)
                    .where(iidx_machine_tags: {machine_tag_id: params[:search][:machine_tag_ids].map(&:to_i)})
                else
                    result.all
                end
            }
        result
    end
end
