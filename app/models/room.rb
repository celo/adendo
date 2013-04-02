class Room < ActiveRecord::Base
  has_many :columns
  has_many :matches
  has_many :players
  attr_accessible :letters, :maxmatches, :maxmatchtime, :maxplayers, :name, :private

  validates_presence_of :name, :maxmatches, :maxmatchtime, :maxplayers, :letters, :created_by
  validates_numericality_of :maxmatches, :maxmatchtime, :maxplayers
end
