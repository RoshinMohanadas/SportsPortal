class CreateTeammembers < ActiveRecord::Migration[6.0]
  def change
    create_table :teammembers do |t|
      t.string :name
      t.date :dob
      t.string :email
      t.string :gender
      t.string :role
      t.text :achievements
      t.string :foodpreference
      t.integer :contactno
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
