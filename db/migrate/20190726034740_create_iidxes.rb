class CreateIidxes < ActiveRecord::Migration[5.1]
  def change
    create_table :iidxes do |t|
      t.text :serial_no
      t.float :spring_weight
      t.float :switch_weight
      t.integer :cash_price
      t.integer :paseli_price
      t.integer :premium_free_time_from
      t.integer :premium_free_time_to

      t.timestamps
    end
  end
end
