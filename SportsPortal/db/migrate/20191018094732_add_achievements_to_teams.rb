class AddAchievementsToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :achievements, :text
  end
end
