class GamesController < ApplicationController
    # GET /users
    # GET /users.json
    def index
      @games = Game.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @games }
      end
    end

    # GET /users/1
    # GET /users/1.json
    def show
      @game = Game.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @game }
      end
    end

    # GET /users/new
    # GET /users/new.json
    def new
      @game = Game.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @game }
      end
    end

    # GET /users/1/edit
    def edit
      @game = Game.find(params[:id])
    end

    # POST /users
    # POST /users.json
    def create
      @game = Game.new(params[:game])
      @game.player1_id = current_user.id

      respond_to do |format|
        if @game.save
          format.html { redirect_to @game, notice: 'Game was successfully created.' }
          format.json { render json: @game, status: :created, location: @game }
        else
          format.html { render action: "new" }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end
  

    # PUT /users/1
    # PUT /users/1.json
    def update
      @game = Game.find(params[:id])

      respond_to do |format|
        if @game.update_attributes(params[:game])
          format.html { redirect_to @game, notice: 'Game was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @game = Game.find(params[:id])
      @game.destroy

      respond_to do |format|
        format.html { redirect_to games_url }
        format.json { head :no_content }
      end
    end
  end