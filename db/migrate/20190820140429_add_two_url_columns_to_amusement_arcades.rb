class AddTwoUrlColumnsToAmusementArcades < ActiveRecord::Migration[5.2]
  def change
    add_column :amusement_arcades, :homepage_url, :string
    add_column :amusement_arcades, :twitter_url, :string
  end
end
