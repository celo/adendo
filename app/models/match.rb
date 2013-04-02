class Match < ActiveRecord::Base
  belongs_to :room
  has_many :answers
  attr_accessible :letter, :started_at, :stopped_at
end
