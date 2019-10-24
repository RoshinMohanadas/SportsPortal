class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :poc
      t.integer :pocmobile
      t.string :pocemail
      t.datetime :arrivaldate
      t.string :arrivalloc
      t.string :modeofarrival
      t.text :arrivaldetails
      t.datetime :departuredate
      t.string :departureloc
      t.string :modeofdeparture
      t.text :departuredetails
      t.text :instructionsfromadmin
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
