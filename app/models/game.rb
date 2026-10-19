# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :tournament

  has_many :team_games, dependent: :destroy
  has_many :teams, through: :team_games

  attr_reader :team_a, :team_b

  validates :score_team_a, :score_team_b, presence: true, numericality: { only_integer: true }
  validates :team_a, :team_b, presence: true
  validate :cannot_end_in_tie

  before_validation :determine_result

  def assign_teams(team_a, team_b)
    @team_a = team_a
    @team_b = team_b
    self.teams = [ team_a, team_b ].compact
  end

  private

  def tie?
    score_team_a.present? && score_team_a == score_team_b
  end

  def cannot_end_in_tie
    errors.add(:base, "A game cannot end in a tie.") if tie?
  end

  def determine_result
    return unless team_a && team_b && score_team_a.present? && score_team_b.present?
    return if tie?

    winner_team, loser_team = score_team_a > score_team_b ? [ team_a, team_b ] : [ team_b, team_a ]
    self.winner = winner_team.name
    self.loser = loser_team.name
  end
end
