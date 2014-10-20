class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :row
      t.integer :column

      t.timestamps
    end
  end
end
