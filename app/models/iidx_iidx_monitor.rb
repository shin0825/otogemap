class IidxIidxMonitor < ApplicationRecord
  belongs_to :iidx_monitor, optional: true
  belongs_to :iidx, optional: true
end
