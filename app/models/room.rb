class Room < ActiveRecord::Base
  has_many :columns
  has_many :matches
  has_many :players
  attr_accessible :letters, :maxmatches, :maxmatchtime, :maxplayers, :name, :private
end
