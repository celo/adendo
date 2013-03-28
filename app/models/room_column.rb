class RoomColumn < ActiveRecord::Base
  belongs_to :room
  attr_accessible :value
end
