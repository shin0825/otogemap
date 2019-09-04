class CreateIidxVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :iidx_versions do |t|
      t.string :name

      t.timestamps
    end
    add_index :iidx_versions, :name, unique: true
  end
end
