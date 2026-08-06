# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    @tournaments = Tournament.find(params[:tournament_id])
    @teams = @tournaments.teams
  end

end
