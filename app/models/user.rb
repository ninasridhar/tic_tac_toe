class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :photo, :role, :username
  has_many :games
  has_many :moves
end
