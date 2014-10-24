require 'pry-byebug'

puts "TicTacToe"

class Game
  attr_accessor :game_board, :taken_squares
  
  def initialize 
    @game_board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @lines = [
      [ 0, 1, 2], 
      [ 3, 4, 5], 
      [ 6, 7, 8], 
      [ 0, 3, 6], 
      [ 1, 4, 7], 
      [ 2, 5, 8], 
      [ 0, 4, 8], 
      [ 6, 4, 2]]
      @taken_squares = []  
    end
  end


  class User
    attr_accessor :moves

    def initialize(username)
      @username = username
      @moves = []
    end

    def turn(player, taken_squares)
      puts "#{@username}pick a square"
      player_move = gets.chomp.to_i

      if position_taken?
        puts "That position is taken, make another move"
        player_move = gets.chomp.to_i
      end
      @moves << player_move
      taken_squares << player_move
    end
  end

  def play_ttt(player1, player2)
    # @lines
    # player1.moves = []
    # player2.moves = []
    game = Game.new

    if  (winner? == false) && (draw? == false)
      player1.turn(player1, game.taken_squares)
      player2.turn(player2, game.taken_squares)
    else
      puts "GAME OVER, #{@game_winner} wins"
    end
  end


  def position_taken?(player_move, taken_squares)
    taken_squares.each do |square|
      if square == player_move
        return true
      else
        return false
      end
    end
  end

  def winner?(lines, player)
    lines.each do |line|
      if player.moves.include?(line[0] && line[1] &&line[2])
        @game_winner = player
        return true
      end
    end
  end

  def draw?(taken_squares, game_board)
    if game.taken_squares.count == 9
      return true
    end
  end

  def start
    puts "What is player 1's username?"
    player1 = User.new(gets.chomp)
    puts "What is player 2's username"
    player2 = User.new(gets.chomp)
    player = player1
    play_ttt(player1, player2)
  end

  start

















  <p>Player 1: <%= @game.player1.username %></p>
  <p>Player 2: <%= @game.player2.username %></p>

  <%= @board.inspect %>
  <%#= @is_the_square_free.inspect %>

  <!-- <!-- <table >
    <tr>
      <td><%= link_to new_game_move_path(@game, move: 0) do %><div><%= @board[0] %></div><% end %></td>
      <td><%= link_to new_game_move_path(@game, move: 1) do %><div><%= @board[1] %></div><% end %></td>
      <td><%= link_to new_game_move_path(@game, move: 2) do %><div><%= @board[2] %></div><% end %></td>
    </tr>
    <tr>
      <td><%= link_to new_game_move_path(@game, move: 3) do %><div><%= @board[3] %></div><% end %></td>
      <td><%= link_to new_game_move_path(@game, move: 4) do %><div><%= @board[4] %></div><% end %></td>
      <td><%= link_to new_game_move_path(@game, move: 5) do %><div><%= @board[5] %></div><% end %></td>
    </tr>
    <tr>
      <td><%= link_to new_game_move_path(@game, move: 6) do %><div><%= @board[6] %></div><% end %></td>
      <td><%= link_to new_game_move_path(@game, move: 7) do %><div><%= @board[7] %></div><% end %></td>
      <td><%= link_to new_game_move_path(@game, move: 8) do %><div><%= @board[8] %></div><% end %></td>
    </tr>
  </table> --> -->

  
  # def winner
  #   @game = Game.find(params[:id])
  #   winning_x = ['X', 'X', 'X']
  #   winning_o = ['O', 'O', 'O']
  #   @board
  
  #    if  @board.values_at(0..2) == winning_x || 
  #     @board.values_at(3..5) == winning_x || 
  #     @board.values_at(6..8) == winning_x || 
  #     @board.values_at(0,3,6) == winning_x || 
  #     @board.values_at(1,4,7) == winning_x || 
  #     @board.values_at(2,5,8) == winning_x || 
  #     @board.values_at(1,4,8) == winning_x || 
  #     @board.values_at(6,4,2) == winning_x
  #       @game_winner = "#{@game.player1.username} wins!"
  #     elsif @board.values_at(0..2) == winning_o || 
  #     @board.values_at(3..5) == winning_o || 
  #     @board.values_at(6..8) == winning_o || 
  #     @board.values_at(0,3,6) == winning_o || 
  #     @board.values_at(1,4,7) == winning_o || 
  #     @board.values_at(2,5,8) == winning_o || 
  #     @board.values_at(1,4,8) == winning_o || 
  #     @board.values_at(6,4,2) == winning_o
  #       @game_winner = "#{@game.player2.username} wins!"
  #   end
  #   @game_won = true
  # end
