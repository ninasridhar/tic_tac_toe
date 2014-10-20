class Moves < ActiveRecord::Base
  attr_accessible :game_id, :move, :player_id
  belongs_to :game
  belongs_to :player
end
