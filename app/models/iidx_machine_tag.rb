class IidxMachineTag < ApplicationRecord
  belongs_to :machine_tag, optional: true
  belongs_to :iidx, optional: true
end
