class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :winner, :player1, :player2

  belongs_to :player1, :class_name => "User"
  belongs_to :player2, :class_name => "User"
  has_many :moves

  
end
