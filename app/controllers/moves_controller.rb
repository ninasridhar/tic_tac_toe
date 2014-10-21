class MovesController < ApplicationController
 
  # def index
  #   game = Game.find(params[:game_id])
  #   @moves = game.moves

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @moves }
  #   end
  # end

  
  # def show
  #   game = Game.find(param[:game_id])
  #   @move = game.move.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @move }
  #   end
  # end

  def new
    @move = Move.create!(move: params[:move], player_id: current_user.id, game_id: params[:game_id])

    game = Game.find(params[:game_id])
  
   redirect_to Game.find(params[:game_id])
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: game }
    # end
  end

  
  # def edit
  #   game = Game.find(params[:game_id])
  #   @move = game.moves.find(params[:id])
  # end


  def create
    game = Game.find(params[:game_id])
    @move = game.moves.create(params[:move])
    # @move.player_id = current_user.id
    # @move.game_id = params[:id]
    
    
    respond_to do |format|
      if @move.save
        
        format.html { redirect_to game, notice: 'Move was successfully created.' }
        format.json { render json: game, status: :created, location: move }
        # if player = player1
        #   player =  player2
        # else 
        #   player = player1
        # end
      else
        format.html { render action: "new" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end


  # def update
  #   game = Game.find(params[:game_id])
  #   @move = game.moves.find(params[:id])
  #   respond_to do |format|
  #     if @move.update_attributes(params[:move])
  #       format.html { redirect_to action: :show, notice: 'Move was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @move.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   game = Game.find(params[:game_id])
  #   @move = game.moves.find(params[:id])
  #   @move.destroy

  #   respond_to do |format|
  #     format.html { redirect_to(game_moves_url) }
  #     format.json { head :no_content }
  #   end
  # end
end
