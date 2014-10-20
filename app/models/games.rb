class Games < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :winner

  belongs_to :player1
  belongs_to :player2
  has_many :moves

  
end
