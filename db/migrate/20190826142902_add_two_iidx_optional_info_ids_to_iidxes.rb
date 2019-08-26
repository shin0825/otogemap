class AddTwoIidxOptionalInfoIdsToIidxes < ActiveRecord::Migration[5.2]
  def change
    add_reference :iidxes, :iidx_machine, foreign_key: true
    add_reference :iidxes, :iidx_monitor, foreign_key: true
  end
end
