class CreateIidxMachineTags < ActiveRecord::Migration[5.2]
  def change
    create_table :iidx_machine_tags do |t|
      t.references :iidx, index: true, foreign_key: true
      t.references :machine_tag, index: true, foreign_key: true
    end
  end
end
