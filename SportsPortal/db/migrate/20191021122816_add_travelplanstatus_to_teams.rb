class AddTravelplanstatusToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :travelplanstatus, :string
  end
end
