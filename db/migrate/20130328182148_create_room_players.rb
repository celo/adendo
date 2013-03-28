class CreateRoomPlayers < ActiveRecord::Migration
  def change
    create_table :room_players do |t|
      t.references :room
      t.references :user

      t.timestamps
    end
    add_index :room_players, :room_id
    add_index :room_players, :user_id
  end
end
