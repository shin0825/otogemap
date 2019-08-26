class IidxMachine < ApplicationRecord
  has_many :iidx_iidx_machines
  has_many :iidxes, through: :iidx_iidx_machines
end
