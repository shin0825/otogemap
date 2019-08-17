class ShopTag < ApplicationRecord
  has_many :amusement_arcade_shop_tags
  has_many :amusement_arcades, through: :amusement_arcade_shop_tags
  validates :name, presence: true, length: {maximum:10}
end
