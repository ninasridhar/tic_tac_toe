class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :winner, :player1, :player2

  belongs_to :player1, :class_name => 'User'
  belongs_to :player2, :class_name => 'User'
  belongs_to :winner, :class_name => 'User'
  has_many :moves

  # def board
  #   @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  # end

  # def taken_squares
  #   @taken_squares = []
  # end

  

  def build_board
    @board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    self.moves.each do |move|
    
      if move.player_id == self.player1.id
        @board[move.move] = 'X'
      else 
        @board[move.move] = 'O'
      end
    end
    @board
  end

  def game_winner
    @board
    @lines = [
      [ 0, 1, 2], 
      [ 3, 4, 5], 
      [ 6, 7, 8], 
      [ 0, 3, 6], 
      [ 1, 4, 7], 
      [ 2, 5, 8], 
      [ 0, 4, 8], 
      [ 6, 4, 2]]
    @lines.any? do |winning_line|
      result1 = winning_line[0]
      result2 = winning_line[1]
      result3 = winning_line[2]

      if @board[result1] == 'X' && @board[result1] == @board[result2] && @board[result1] == @board[result3]
        @win = true
        self.winner = player1
      elsif @board[result1] == 'O' && @board[result1] == @board[result2] && @board[result1] == @board[result3]
        
        @win  = true
        self.winner = player2

      end
  
    end
 
  end


  def draw
      "It's a draw!" if (@win == false || @win.nil?) && (@board.include?(nil) != true)
  end

  def last_player
    if self.moves != []
   self.moves.last.player_id
 end
  end


end
