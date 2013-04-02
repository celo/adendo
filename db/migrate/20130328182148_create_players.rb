class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :room
      t.references :user

      t.timestamps
    end
    add_index :players, :room_id
    add_index :players, :user_id
  end
end
