class MovesController < ApplicationController

  def new
    @move = Move.create!(move: params[:move], player_id: current_user.id, game_id: params[:game_id])

    game = Game.find(params[:game_id])
  
   redirect_to Game.find(params[:game_id])
   
  end

  
  def create
    game = Game.find(params[:game_id])
    @move = game.moves.create(params[:move])
    respond_to do |format|
      if @move.save
        
        format.html { redirect_to game, notice: 'Move was successfully created.' }
        format.json { render json: game, status: :created, location: move }
      else
        format.html { render action: "new" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end
end
