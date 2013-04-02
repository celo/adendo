class Room < ActiveRecord::Base
  has_many :columns
  has_many :matches
  has_many :players
  attr_accessible :letters, :maxmatches, :maxmatchtime, :maxplayers, :name, :private

  validates_presence_of :name, :maxmatches, :maxmatchtime, :maxplayers, :letters
  validates_numericality_of :maxmatches, :maxmatchtime, :maxplayers
  validates :letters, :format => { :with => /\A[a-zA-Z]+\z/ }

end
