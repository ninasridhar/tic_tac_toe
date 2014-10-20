class GamesController < ApplicationController
  def index
    
  end

  def show
    
  end

  def start_game
    game = Game.new
    game.player1 = player1
    game.player2 = player2
  end

  def moves
    
  end
end