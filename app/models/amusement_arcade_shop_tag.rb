class AmusementArcadeShopTag < ApplicationRecord
  belongs_to :shop_tag, optional: true
  belongs_to :amusement_arcade, optional: true
end
