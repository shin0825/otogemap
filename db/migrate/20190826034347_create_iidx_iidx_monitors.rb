class CreateIidxIidxMonitors < ActiveRecord::Migration[5.2]
  def change
    create_table :iidx_iidx_monitors do |t|
      t.references :iidx, index: true, foreign_key: true
      t.references :iidx_monitor, index: true, foreign_key: true
    end
  end
end
