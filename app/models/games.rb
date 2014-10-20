class Games < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :winner

  belongs_to :player1
  belongs_to :player2
  has_many :moves

  @game_board = [a1, a2, a3, b1, b2, b3, c1 , c2, c3]

  # @places = {
  #   "a1"=>" ","a2"=>" ","a3"=>" ",
  #   "b1"=>" ","b2"=>" ","b3"=>" ",
  #   "c1"=>" ","c2"=>" ","c3"=>" "
  # }

  @turn  = 0

  @winning_combos = [a1 == a2 == a3, b1 == b2 == b3, c1 == c2 == c3, a1 == b1 == c1, a2 == b2 == c2, a3 == b3 == c3, a1 == b2 == c3, c1 == b2 == a3]

  @player1 == 'X'
  @player2 == 'O'

  def game_over?

    
  end

  def turns
    
  end
end
