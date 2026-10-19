class Tournament < ApplicationRecord
  has_many :games

  has_many :team_tournaments
  has_many :teams, through: :team_tournaments

  validates :name, :location, :start_time, :end_time, presence: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    erros.add(:end_time, "must be after the start time") if end_time <= start_time
  end
end
