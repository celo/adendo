class Answer < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  belongs_to :column
  attr_accessible :score, :value
end
