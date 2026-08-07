class Tournament < ApplicationRecord
  has_many :games

  has_many :team_tournaments
  has_many :teams, through: :team_tournaments

  validates :name, :location, :start_time, :end_time, presence: true

end