class AddAmusementArcadesIdToIidxes < ActiveRecord::Migration[5.1]
  def change
    add_reference :iidxes, :amusement_arcade, foreign_key: true
  end
end
