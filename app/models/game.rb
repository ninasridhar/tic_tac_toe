class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :winner, :player1, :player2

  belongs_to :player1, :class_name => 'User'
  belongs_to :player2, :class_name => 'User'
  belongs_to :winner, :class_name => 'User'
  has_many :moves

  scope :find_user, -> (user) {where('player1_id = :user_id OR player2_id = :user_id', {user_id: user.id})}



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
          self.winner =  player1


        elsif @board[result1] == 'O' && @board[result1] == @board[result2] && @board[result1] == @board[result3]
          @win  = true
          self.winner = player2
          
        end

      end
    end

    def draw
      if (@win == false || @win.nil?) && (@board.include?(nil) != true)
       
        @draw = true
        "It's a draw!"
      end
    end

    def last_player
      if self.moves != []
        self.moves.last.player_id
      end
    end

    def computer_or_not
     if (self.player2_id == 1)
      self.computer_makes_move
    end
  end

  def game_over?
    (@win == true ) ||  (@draw == true)
  end

  def computer_makes_move
    if (self.player1_id == self.last_player)
      index = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      number = index.sample
      @board[number]
      if (@board_number == nil)
        Move.create(player_id: 1, game_id: self.id, move: number)
      end
    end
  end
end
