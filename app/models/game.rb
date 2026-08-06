class Game < ApplicationRecord
  belongs_to :tournament
  has_many :team_games
  has_many :teams, through: :team_games
end
