class RoomMatch < ActiveRecord::Base
  belongs_to :room
  attr_accessible :letter, :started_at, :stopped_at
end
