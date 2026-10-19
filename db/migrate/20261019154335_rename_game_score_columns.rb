class RenameGameScoreColumns < ActiveRecord::Migration[8.1]
  def change
    rename_column :games, :scoreTeamA, :score_team_a
    rename_column :games, :scoreTeamB, :score_team_b
  end
end
