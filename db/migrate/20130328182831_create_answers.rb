class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :player
      t.references :match
      t.references :column
      t.string :value
      t.integer :score

      t.timestamps
    end
    add_index :answers, :player_id
    add_index :answers, :match_id
    add_index :answers, :column_id
  end
end
