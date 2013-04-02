class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :name
      t.references :room

      t.timestamps
    end
    add_index :columns, :room_id
  end
end
