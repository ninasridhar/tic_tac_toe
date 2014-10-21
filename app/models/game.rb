class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :winner, :player1, :player2

  belongs_to :player1, :class_name => "User"
  belongs_to :player2, :class_name => "User"
  has_many :moves

  # def board
  #   @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  # end

  # def taken_squares
  #   @taken_squares = []
  # end

  def build_board
    board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    self.moves.each do |move|
    
      if move.player_id == self.player1.id
        board[move.move] = 'X'
      else 
        board[move.move] = 'O'
      end
    end
    board
  end


end
