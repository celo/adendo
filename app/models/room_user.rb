class RoomUser < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  # attr_accessible :title, :body
end
