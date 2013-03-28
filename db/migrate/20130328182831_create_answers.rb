class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :room_player
      t.references :room_match
      t.references :room_column
      t.string :value
      t.integer :score

      t.timestamps
    end
    add_index :answers, :room_player_id
    add_index :answers, :room_match_id
    add_index :answers, :room_column_id
  end
end
