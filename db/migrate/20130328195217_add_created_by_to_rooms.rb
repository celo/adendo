class AddCreatedByToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :created_by, :integer
  end
end
