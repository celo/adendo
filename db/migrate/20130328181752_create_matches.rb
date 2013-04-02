class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :room
      t.string :letter
      t.datetime :started_at
      t.datetime :stopped_at

      t.timestamps
    end
    add_index :matches, :room_id
  end
end
