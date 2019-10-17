class CreateEventgroups < ActiveRecord::Migration[6.0]
  def change
    create_table :eventgroups do |t|
      t.string :name
      t.text :description
      t.date :regstartdate
      t.date :regenddate
      t.date :startdate
      t.date :enddate
      t.boolean :isactive
      t.string :venue

      t.timestamps
    end
  end
end
