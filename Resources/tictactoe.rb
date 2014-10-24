require 'pry-byebug'

puts "TicTacToe"


class Game
  attr_accessor :game_board, :taken_squares
  
  def initialize 
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @taken_squares = [nil, nil, nil, nil, nil, nil, nil, nil, nil]  
  end

end

class Player
  attr_accessor :moves

  def initialize(username)
    @username = username
    @moves = []
  end

  def turn(player, taken_squares)
    puts "#{@username}, where would you like to place your #{letter}? Enter a number between 1 and 9:"
    player_move = gets.chomp.to_i

    while position_taken?(player_move, taken_squares) || not_a_square?(player_move)
      if position_taken?(player_move, taken_squares)
        puts "#{@username}, that move is already taken! Try again:"
        player_move = gets.chomp.to_i
      end
      if not_a_square?(next_move)
        puts "#{@name}, please enter a number that is between 1 and 9:"
        player_move = gets.chomp.to_i
      end
    end

    @moves.push(player_move)
    return player_move
  end
end



def play_ttt(player1, player2)

  @winning_x = ['X', 'X', 'X']
  @winning_o = ['O', 'O', 'O']
  taken_squares = [nil, nil, nil, nil, nil, nil, nil, nil, nil]  

  if taken_squares.values_at(0..2) == @winning_x || taken_squares.values_at(3..5) == @winning_x || taken_squares.values_at(6..8) == @winning_x || taken_squares.values_at(0,3,6) == @winning_x || taken_squares.values_at(1,4,7) == @winning_x || taken_squares.values_at(2,5,8) == @winning_x || taken_squares.values_at(1,4,8) == @winning_x || taken_squares.values_at(6,4,2) == @winning_x
    puts "Player 1 wins"
  else 
  end

  if taken_squares.values_at(0..2) == @winning_o
    puts "Player 2 wins"
  elsif taken_squares.values_at(3..5) == @winning_o
    puts "Player 2 wins"
  elsif taken_squares.values_at(6..8) == @winning_o
    puts "Player 2 wins"
  elsif taken_squares.values_at(0,3,6) == @winning_o
    puts "Player 2 wins"
  elsif taken_squares.values_at(1,4,7) == @winning_o
    puts "Player 2 wins"
  elsif taken_squares.values_at(2,5,8) == @winning_o
    puts "Player 2 wins"
  elsif taken_squares.values_at(1,4,8) == @winning_o
    puts "Player 2 wins"
  elsif taken_squares.values_at(6,4,2) == @winning_o
    puts "Player 2 wins"
  else 

  end
end

def start
  puts "What is player 1's username?"
  player1 = Player.new(gets.chomp)
  puts "What is player 2's username"
  player2 = Player.new(gets.chomp)
  play_ttt(player1, player2)
end

def position_taken?(taken_squares)
  taken_squares.each do |square|
    if square != nil 
      position_taken = true
    else
      position_taken = false
    end
  end
end

def position_taken?(taken_squares)
  taken_squares.each do |square|
    if square != nil 
      position_taken = true
    else
      position_taken = false
    end
  end
end

start

# class Game
#   attr_accessor :game_board, :taken_squares
  
#   def initialize 
#     @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
#     @taken_squares = []
#     # @taken_squares = [nil, nil, nil, nil, nil, nil, nil, nil, nil]  
#   end

#   def display
#     puts "Here is the current game board:"
#     puts "#{@game_board[0]}|#{@game_board[1]}|#{@game_board[2]}\n#{@game_board[3]}|#{@game_board[4]}|#{@game_board[5]}\n#{@game_board[6]}|#{@game_board[7]}|#{@game_board[8]}"
#   end

# end

# class Player
#   attr_accessor :moves

#   def initialize(username)
#     @username = username
#     @moves = []
#   end

#   def turn(player, taken_squares)
#     puts "#{@username}, where would you like to place your #{letter}? Enter a number between 1 and 9:"
#     player_move = gets.chomp.to_i

#     while position_taken?(player_move, taken_squares) || not_a_square?(player_move)
#       if position_taken?(player_move, taken_squares)
#         puts "#{@username}, that move is already taken! Try again:"
#         player_move = gets.chomp.to_i
#       end
#       if not_a_square?(next_move)
#         puts "#{@name}, please enter a number that is between 1 and 9:"
#         next_move = gets.chomp.to_i
#       end
#     end

#     @moves.push(player_move)
#     return player_move
#   end
# end

winning moves array

def check_win
  @baord
  result = winning_moves.any? do |winnign sol
    result  =wining[0]
    result  =wining[0]
    result  =wining[0]

    @board[result1] != nil && 




