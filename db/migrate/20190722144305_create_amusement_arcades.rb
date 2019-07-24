class CreateAmusementArcades < ActiveRecord::Migration[5.1]
  def change
    create_table :amusement_arcades do |t|
      t.text :name
      t.text :name_kana
      t.references :prefecture, foreign_key: true
      t.text :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
