class Team < ApplicationRecord
  has_many :players
  has_many :team_games
  has_many :team_tournaments
end
