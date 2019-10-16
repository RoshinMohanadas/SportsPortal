class CreateEventGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :event_groups do |t|
      t.string :name
      t.text :description
      t.datetime :reg_start_date
      t.datetime :reg_end_date
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_active
      t.string :venue

      t.timestamps
    end
  end
end
