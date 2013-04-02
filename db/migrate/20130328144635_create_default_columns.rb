class CreateDefaultColumns < ActiveRecord::Migration
  def change
    create_table :default_columns do |t|
      t.string :name

      t.timestamps
    end
  end
end
