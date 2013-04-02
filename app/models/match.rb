class Match < ActiveRecord::Base
  belongs_to :room
  has_many :answers
  attr_accessible :letter, :started_at, :stopped_at

  validates_presence_of :letter
  validates_uniqueness_of :letter, :scope => :room_id

end
