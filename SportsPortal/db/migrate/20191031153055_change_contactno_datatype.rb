class ChangeContactnoDatatype < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :contactno, :string
    change_column :teams, :pocmobile, :string
    change_column :teammembers, :contactno, :string
  end
end
