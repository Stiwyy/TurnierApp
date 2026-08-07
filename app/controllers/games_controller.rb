# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @games = @tournament.games
  end

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @game = @tournament.games.new
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @game = @tournament.games.new(game_params)

    team_a = @tournament.teams.find(params[:game][:team_a_id])
    team_b = @tournament.teams.find(params[:game][:team_b_id])

    if @game.scoreTeamA > @game.scoreTeamB
      @game.winner = team_a.name
      @game.loser = team_b.name
    else
      @game.winner = team_b.name
      @game.loser = team_a.name
    end
    if @game.scoreTeamA == @game.scoreTeamB
      @game.errors.add(:base, "A game cannot end in a tie.")
      render :new, status: :unprocessable_entity
      return
    end


    if @game.save
      @game.teams << team_a
      @game.teams << team_b

      redirect_to tournament_games_path(@tournament),
                  notice: "Game created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(
      :scoreTeamA,
      :scoreTeamB,
      :duration
    )
  end


end
