class CreateIidxMonitors < ActiveRecord::Migration[5.2]
  def change
    create_table :iidx_monitors do |t|
      t.string :name

      t.timestamps
    end
    add_index :iidx_monitors, :name, unique: true
  end
end
