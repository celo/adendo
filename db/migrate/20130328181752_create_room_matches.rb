class CreateRoomMatches < ActiveRecord::Migration
  def change
    create_table :room_matches do |t|
      t.references :room
      t.string :letter
      t.datetime :start_time
      t.datetime :stop_time

      t.timestamps
    end
    add_index :room_matches, :room_id
  end
end
