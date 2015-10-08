class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :raw_tuning
      t.integer :energy

      t.timestamps null: false
    end
  end
end
