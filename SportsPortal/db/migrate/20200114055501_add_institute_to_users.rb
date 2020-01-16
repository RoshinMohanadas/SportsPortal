class AddInstituteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :institute, null: true, foreign_key: true
  end
end
