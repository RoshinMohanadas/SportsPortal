class CreateEditcontents < ActiveRecord::Migration[6.0]
  def change
    create_table :editcontents do |t|
      t.string :welcometext
      t.text :about
      t.text :facilities
      t.text :contact

      t.timestamps
    end
  end
end
