class Player < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  has_many :answers
end
