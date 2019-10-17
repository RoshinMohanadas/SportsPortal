class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :event_type
      t.text :event_rules
      t.references :EventGroup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
