class Game < ApplicationRecord
  has_many :players
  belongs_to :tournament
end
