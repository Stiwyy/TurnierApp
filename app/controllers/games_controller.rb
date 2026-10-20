# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_tournament

  def index
    @games = @tournament.games
  end

  def new
    @game = @tournament.games.new
  end

  def create
    @game = @tournament.games.new(game_params)
    @game.team_a = find_team(:team_a_id)
    @game.team_b = find_team(:team_b_id)

    if @game.save
      redirect_to tournament_games_path(@tournament), notice: "Game created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:score_team_a, :score_team_b, :duration, :team_a_id, :team_b_id)
  end

  def find_team(key)
    @tournament.teams.find(params[:game][key])
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
