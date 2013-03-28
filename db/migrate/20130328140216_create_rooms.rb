class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :letters
      t.integer :maxplayers
      t.integer :maxmatches
      t.integer :maxmatchtime
      t.boolean :private

      t.timestamps
    end
  end
end
