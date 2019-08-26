class IidxIidxMachine < ApplicationRecord
  belongs_to :iidx_machine, optional: true
  belongs_to :iidx, optional: true
end
