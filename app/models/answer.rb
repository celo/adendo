class Answer < ActiveRecord::Base
  belongs_to :room_player
  belongs_to :room_match
  belongs_to :room_column
  attr_accessible :score, :value
end
