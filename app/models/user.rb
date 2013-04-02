class User < ActiveRecord::Base
  has_many :players
  attr_accessible :email, :name, :password
end
