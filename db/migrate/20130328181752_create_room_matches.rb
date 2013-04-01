class CreateRoomMatches < ActiveRecord::Migration
  def change
    create_table :room_matches do |t|
      t.references :room
      t.string :letter
      t.datetime :started_at
      t.datetime :stopped_at

      t.timestamps
    end
    add_index :room_matches, :room_id
  end
end
