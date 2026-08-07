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
  end

  def create

  end
  private
  def tournament_params
    params.require(:team).permit(:name, :location, :start_time, :end_time)
  end
end