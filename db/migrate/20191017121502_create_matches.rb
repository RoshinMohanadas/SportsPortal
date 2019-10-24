class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :description
      t.datetime :matchstarttime
      t.string :round
      t.string :teamone
      t.string :teamtwo
      t.string :venue
      t.string :result
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
