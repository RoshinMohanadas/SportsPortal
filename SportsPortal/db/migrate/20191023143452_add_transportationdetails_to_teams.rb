class AddTransportationdetailsToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :arrivaltravelarrangement, :text
    add_column :teams, :departuretravelarrangement, :text
  end
end
