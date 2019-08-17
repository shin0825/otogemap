class CreateAmusementArcadeShopTags < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_arcade_shop_tags do |t|
      t.references :amusement_arcade, index: true, foreign_key: true
      t.references :shop_tag, index: true, foreign_key: true
    end
  end
end
