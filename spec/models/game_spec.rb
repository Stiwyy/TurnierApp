require "rails_helper"

RSpec.describe Game, type: :model do
  let(:tournament) do
    Tournament.create!(
      name: "Summer Cup",
      location: "Town Field",
      start_time: Time.current,
      end_time: 2.hours.from_now
    )
  end
  let(:team_a) { Team.create!(name: "Falcons") }
  let(:team_b) { Team.create!(name: "Wolves") }
  let(:game) do
    Game.new(
      tournament: tournament,
      team_a: team_a,
      team_b: team_b,
      score_team_a: 3,
      score_team_b: 1
    )
  end

  describe "associations" do
    it { is_expected.to belong_to(:tournament) }
    it { is_expected.to belong_to(:team_a).class_name("Team") }
    it { is_expected.to belong_to(:team_b).class_name("Team") }
  end

  describe "validations" do
    it "requires integer scores" do
      expect(game).to be_valid
      game.score_team_a = nil
      expect(game).not_to be_valid
      expect(game.errors[:score_team_a]).to be_present

      game.score_team_a = 1.5
      expect(game).not_to be_valid
      expect(game.errors[:score_team_a]).to be_present
    end

    it "does not allow a tied score" do
      game.score_team_b = 3

      expect(game).not_to be_valid
      expect(game.errors[:base]).to include("A game cannot end in a tie.")
    end

    it "does not allow a team to play itself" do
      game.team_b = team_a

      expect(game).not_to be_valid
      expect(game.errors[:team_a]).to include("and Team B must be different")
    end
  end

  describe "result determination" do
    it "sets the winner and loser from the scores" do
      expect(game).to be_valid
      expect(game.winner).to eq("Falcons")
      expect(game.loser).to eq("Wolves")
    end

    it "assigns the other team as winner when team B scores more" do
      game.score_team_a = 1
      game.score_team_b = 4

      expect(game).to be_valid
      expect(game.winner).to eq("Wolves")
      expect(game.loser).to eq("Falcons")
    end
  end
end
