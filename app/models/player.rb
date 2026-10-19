class Player < ApplicationRecord
  belongs_to :team

  validates :first_name, :last_name, :number, :position, presence: true
  validates :number, uniqueness: { scope: :team_id }
end
