class AddColumnToIidx < ActiveRecord::Migration[5.1]
  def change
    add_column :iidxes, :paseli_availability, :boolean
  end
end
