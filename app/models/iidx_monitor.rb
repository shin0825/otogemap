class IidxMonitor < ApplicationRecord
  has_many :iidx_iidx_monitors
  has_many :iidxes, through: :iidx_iidx_monitors
end
