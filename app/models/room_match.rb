class RoomMatch < ActiveRecord::Base
  belongs_to :room
  attr_accessible :letter, :start_time, :stop_time
end
