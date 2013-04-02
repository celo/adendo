class Answer < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  belongs_to :column
  attr_accessible :score, :value

  validates_presence_of :player_id, :match_id, :column_id, :value


end
