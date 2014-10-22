class Move < ActiveRecord::Base
  attr_accessible :game_id, :move, :player_id
  belongs_to :game
  belongs_to :player

  # def position_taken?(@board)
  #   @board.each do |position|
  #     if position != nil
  #       return true
  #     else
  #       return false
  #     end
  #   end
  # end
end
