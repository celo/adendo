class Room < ActiveRecord::Base
  attr_accessible :letters, :maxmatches, :maxmatchtime, :maxplayers, :name, :private
end
