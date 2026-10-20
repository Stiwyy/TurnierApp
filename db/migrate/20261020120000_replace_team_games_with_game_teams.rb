class ReplaceTeamGamesWithGameTeams < ActiveRecord::Migration[8.1]
  def up
    add_reference :games, :team_a, foreign_key: { to_table: :teams }
    add_reference :games, :team_b, foreign_key: { to_table: :teams }

    execute <<~SQL
      UPDATE games
      SET team_a_id = (SELECT team_id FROM team_games WHERE game_id = games.id ORDER BY id LIMIT 1),
          team_b_id = (SELECT team_id FROM team_games WHERE game_id = games.id ORDER BY id LIMIT 1 OFFSET 1)
    SQL

    change_column_null :games, :team_a_id, false
    change_column_null :games, :team_b_id, false
    drop_table :team_games
  end

  def down
    create_table :team_games do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true
      t.timestamps
    end

    execute <<~SQL
      INSERT INTO team_games (team_id, game_id, created_at, updated_at)
      SELECT team_a_id, id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM games
      UNION ALL
      SELECT team_b_id, id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM games
    SQL

    remove_reference :games, :team_a, foreign_key: true
    remove_reference :games, :team_b, foreign_key: true
  end
end
