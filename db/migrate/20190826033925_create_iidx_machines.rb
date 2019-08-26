class CreateIidxMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :iidx_machines do |t|
      t.string :name

      t.timestamps
    end
    add_index :iidx_machines, :name, unique: true
  end
end
