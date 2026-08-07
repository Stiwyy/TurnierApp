# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @games = @tournament.games
  end
end
