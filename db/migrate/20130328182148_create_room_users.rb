class CreateRoomUsers < ActiveRecord::Migration
  def change
    create_table :room_users do |t|
      t.references :room
      t.references :user

      t.timestamps
    end
    add_index :room_users, :room_id
    add_index :room_users, :user_id
  end
end
