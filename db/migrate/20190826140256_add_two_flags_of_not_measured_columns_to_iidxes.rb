class AddTwoFlagsOfNotMeasuredColumnsToIidxes < ActiveRecord::Migration[5.2]
  def change
    add_column :iidxes, :spring_is_found_value, :boolean, default: false, null: false
    add_column :iidxes, :switch_is_found_value, :boolean, default: false, null: false
  end
end
