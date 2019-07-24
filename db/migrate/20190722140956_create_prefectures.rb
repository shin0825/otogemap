class CreatePrefectures < ActiveRecord::Migration[5.1]
  def change
    create_table :prefectures do |t|
      t.text :name
      t.text :name_kana

      t.timestamps
    end
  end
end
