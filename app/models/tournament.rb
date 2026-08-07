class Tournament < ApplicationRecord
  has_many :games

  has_many :team_tournaments
  has_many :teams, through: :team_tournaments
end