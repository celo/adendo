class Column < ActiveRecord::Base
  belongs_to :room
  has_many :answers

  attr_accessible :name
end
