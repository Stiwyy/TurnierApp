class Tournament < ApplicationRecord
  has_many :games
  has_many :team_tournaments
end
