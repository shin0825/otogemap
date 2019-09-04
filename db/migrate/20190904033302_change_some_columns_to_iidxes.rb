class ChangeSomeColumnsToIidxes < ActiveRecord::Migration[5.2]
  def change
    rename_column :iidxes, :paseli_premium_price, :paseli_standard_price
    add_column :iidxes, :paseli_premium_price, :integer
    add_column :iidxes, :premium_free_price_from, :integer
    add_column :iidxes, :premium_free_price_to, :integer
    add_reference :iidxes, :iidx_version, foreign_key: true
  end
end
