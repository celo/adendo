class User < ActiveRecord::Base
  has_many :players
  attr_accessible :name, :email, :password

  validates_presence_of :name, :email, :password
end
