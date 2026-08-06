class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.belongs_to :tournament, null: false, foreign_key: true

      t.integer :scoreTeamA
      t.integer :scoreTeamB
      t.float :duration
      t.string :winner
      t.string :loser

      t.timestamps
    end
  end
end
