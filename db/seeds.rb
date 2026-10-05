Player.destroy_all
TeamGame.destroy_all
Game.destroy_all
TeamTournament.destroy_all
Team.destroy_all
Tournament.destroy_all

tournament = Tournament.create!(
  name: "National Volleyball Cup 2026",
  location: "Zurich",
  start_time: Time.current,
  end_time: Time.current + 2.days
)

team_names = [
  "Zurich Spikers",
  "Geneva Falcons",
  "Basel Titans",
  "Bern Storm",
  "Lausanne Waves",
  "Lucerne Aces",
  "Lugano Panthers",
  "Winterthur Wolves"
]

positions = [
  "Setter",
  "Outside Hitter",
  "Opposite",
  "Middle Blocker",
  "Libero"
]

first_names = %w[
  Liam Noah Oliver James Lucas Ethan Mason Logan Benjamin Henry
  Daniel Samuel Leo Felix Julian Nico Adrian David
]

last_names = %w[
  Müller Meier Schmid Keller Weber Fischer Baumann Steiner Brunner
  Frei Vogel Huber Koch Roth Graf Sutter
]

teams = team_names.map do |name|
  team = Team.create!(name: name)

  TeamTournament.create!(
    team: team,
    tournament: tournament
  )

  jersey_numbers = (1..20).to_a.shuffle.first(12)

  12.times do |i|
    Player.create!(
      name: first_names.sample,
      surname: last_names.sample,
      number: jersey_numbers[i],
      position: positions.sample,
      date_of_birth: rand(Date.new(1995, 1, 1)..Date.new(2007, 12, 31)),
      team: team
    )
  end

  team
end

teams.each_slice(2) do |team_a, team_b|
  next unless team_b

  score_a = rand(0..25)
  score_b = rand(0..25)

  until (score_a == 25 || score_b == 25) && score_a != score_b
    score_a = rand(0..25)
    score_b = rand(0..25)
  end

  game = Game.create!(
    tournament_id: tournament.id,
    scoreTeamA: score_a,
    scoreTeamB: score_b,
    winner: score_a > score_b ? team_a.name : team_b.name,
    loser: score_a > score_b ? team_b.name : team_a.name,
    duration: rand(60.0..120.0).round(1)
  )

  TeamGame.create!(
    team: team_a,
    game: game
  )

  TeamGame.create!(
    team: team_b,
    game: game
  )
end
