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
end