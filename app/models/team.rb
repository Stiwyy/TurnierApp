class Team < ApplicationRecord
  has_many :players
  has_many :team_games
end
