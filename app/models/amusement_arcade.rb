class AmusementArcade < ApplicationRecord
  validates :prefecture_id, presence: true
  belongs_to :prefecture
end
