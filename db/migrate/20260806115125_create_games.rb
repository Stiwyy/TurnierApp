class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.integer :scoreTeamA
      t.integer :scoreTeamB
      t.float :duration
      t.string :winner
      t.string :loser

      t.timestamps
    end
  end
end
