# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :tournament

  has_many :team_games, dependent: :destroy
  has_many :teams, through: :team_games

  attr_reader :team_a, :team_b

  validates :scoreTeamA, :scoreTeamB, presence: true, numericality: { only_integer: true }
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
    scoreTeamA.present? && scoreTeamA == scoreTeamB
  end

  def cannot_end_in_tie
    errors.add(:base, "A game cannot end in a tie.") if tie?
  end

  def determine_result
    return unless team_a && team_b && scoreTeamA.present? && scoreTeamB.present?
    return if tie?

    winner_team, loser_team = scoreTeamA > scoreTeamB ? [ team_a, team_b ] : [ team_b, team_a ]
    self.winner = winner_team.name
    self.loser = loser_team.name
  end
end
