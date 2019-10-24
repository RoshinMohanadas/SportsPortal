class AddStatusToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :status, :string
  end
end
