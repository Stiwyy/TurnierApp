# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @teams = @tournament.teams
  end

  def show
    @tournament = Tournament.find(params[:tournament_id])
    @team = @tournament.teams.find(params[:id])
  end

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @team = @tournament.teams.new
    @team.players.build
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @team = Team.new(team_params)

    if @team.save
      redirect_to tournament_team_path(@tournament, @team)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, tournament_ids: [])
  end
end