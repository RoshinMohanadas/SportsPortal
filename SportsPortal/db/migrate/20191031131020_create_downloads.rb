class CreateDownloads < ActiveRecord::Migration[6.0]
  def change
    create_table :downloads do |t|
      t.text :title
      t.string :accesslevel

      t.timestamps
    end
  end
end
