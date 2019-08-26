class CreateIidxIidxMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :iidx_iidx_machines do |t|
      t.references :iidx, index: true, foreign_key: true
      t.references :iidx_machine, index: true, foreign_key: true
    end
  end
end
