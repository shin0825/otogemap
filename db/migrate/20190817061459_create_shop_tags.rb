class CreateShopTags < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_tags do |t|
      t.string :name

      t.timestamps
    end
    add_index :shop_tags, :name, unique: true
  end
end
