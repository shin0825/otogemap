class Iidx < ApplicationRecord
    belongs_to :amusement_arcade, optional: true
    belongs_to :iidx_machine, optional: true
    belongs_to :iidx_monitor, optional: true
    belongs_to :iidx_version, optional: true
    has_many :iidx_machine_tags, dependent: :destroy
    has_many :machine_tags, through: :iidx_machine_tags
    accepts_nested_attributes_for :machine_tags, allow_destroy: true

    validates :serial_no, length: { is: 12 }, format: { with: /\A[a-zA-Z]{6}\d{6}\z/, message: "シリアルは半角アルファベット6文字と半角数値6文字となります" }, allow_nil: true, allow_blank: true
    validates :spring_weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_nil: true
    validates :switch_weight, numericality: { greater_than_or_equal_to: 0.00, less_than_or_equal_to: 1.00}, allow_nil: true
    validates :cash_price, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000}, presence: true
    validates :paseli_availability, inclusion: { in: [true, false] }
    validates :paseli_standard_price, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :paseli_premium_price, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :premium_free_price_from, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :premium_free_price_to, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 1000 }, allow_nil: true
    validates :premium_free_time_from, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }, allow_nil: true
    validates :premium_free_time_to, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }, allow_nil: true

    def self.search(params)
        keywords = params[:search][:key_words].strip.split(/[[:blank:]]+/)
        serial_no = params[:search][:serial_no]
        switch_weight = number?(params[:search][:switch]) ? params[:search][:switch] : nil
        spring_weight = number?(params[:search][:spring]) ? params[:search][:spring] : nil
        prefecture_id =  params[:search][:prefecture_id].present? ? params[:search][:prefecture_id] : 23 # TODO: magicnumber
        machine_tag_ids =  params[:search][:machine_tag_ids]
        iidx_machine_id =  params[:search][:iidx_machine_id]
        iidx_monitor_id =  params[:search][:iidx_monitor_id]
        iidx_version_id =  params[:search][:iidx_version_id]

        result = Iidx.all
            .joins(amusement_arcade: :prefecture)
            .merge(Prefecture.where(id: prefecture_id)) # TODO: AmusementArcadeのscopeにうつす
            .then{|result|
                if serial_no.present?
                    result.where("serial_no LIKE ?", "%#{serial_no}%")
                else
                    result
                end
            }
            .then{|result|
                if keywords.length > 0
                    keyword_array = keywords.map {|val| "%#{val}%" }
                    result.where("iidxes.name ILIKE ANY ( array[?] )", keyword_array)
                else
                    result
                end
            }
            .then{|result|
                if machine_tag_ids.present?
                    result.includes(:iidx_machine_tags)
                    .where(iidx_machine_tags: {machine_tag_id: machine_tag_ids.map(&:to_i)})
                else
                    result
                end
            }
            .then{|result|
                if iidx_machine_id.present?
                    result.includes(:iidx_machine)
                    .where(iidx_machine_id: iidx_machine_id)
                else
                    result
                end
            }
            .then{|result|
                if iidx_monitor_id.present?
                    result.includes(:iidx_monitor)
                    .where(iidx_monitor_id: iidx_monitor_id)
                else
                    result
                end
            }
            .then{|result|
                if iidx_version_id.present?
                    result.includes(:iidx_version)
                    .where(iidx_version_id: iidx_version_id)
                else
                    result
                end
            }
            .then{|result|
                if switch_weight.present?
                    result.where("abs(switch_weight - ?) <= 0.09", switch_weight) #差分の絶対値が0.05以内のものを検索　近似値的な
                else
                    result
                end
            }
            .then{|result|
                if spring_weight.present?
                    result.where("abs(spring_weight - ?) <= 9", spring_weight) #差分の絶対値が5以内のものを検索　近似値的な
                else
                    result
                end
            }
        result
    end

    def self.number?(str)
        str =~ /\A-?\d+(.\d+)?\Z/
    end
end
