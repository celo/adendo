class CreateRoomColumns < ActiveRecord::Migration
  def change
    create_table :room_columns do |t|
      t.string :value
      t.references :room

      t.timestamps
    end
    add_index :room_columns, :room_id
  end
end
