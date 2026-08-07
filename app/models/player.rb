class Player < ApplicationRecord
  belongs_to :team

  validates :name, :surname, :number, :position, presence: true
  validates :number, uniqueness: { scope: :team_id }
end