class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  has_many :team_a_games, class_name: "Game", foreign_key: :team_a_id, dependent: :restrict_with_exception
  has_many :team_b_games, class_name: "Game", foreign_key: :team_b_id, dependent: :restrict_with_exception

  def games
    Game.where(id: team_a_games.select(:id)).or(Game.where(id: team_b_games.select(:id)))
  end

  has_many :team_tournaments
  has_many :tournaments, through: :team_tournaments

  validates :name, presence: true
  validates :name, uniqueness: true
end
