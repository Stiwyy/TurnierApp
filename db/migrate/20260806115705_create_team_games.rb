class CreateTeamGames < ActiveRecord::Migration[8.1]
  def change
    create_table :team_games do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
