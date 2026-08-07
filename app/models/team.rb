class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  has_many :team_games
  has_many :games, through: :team_games

  has_many :team_tournaments
  has_many :tournaments, through: :team_tournaments


end