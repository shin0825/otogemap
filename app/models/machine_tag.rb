class MachineTag < ApplicationRecord
  has_many :iidx_machine_tags
  has_many :iidxes, through: :iidx_machine_tags
  validates :name, presence: true, length: {maximum:10}
end
