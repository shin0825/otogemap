class CreateMachineTags < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_tags do |t|
      t.string :name

      t.timestamps
    end
    add_index :machine_tags, :name, unique: true
  end
end
