# frozen_string_literal: true

class PlayersController < ApplicationController
  def new
    @tournament = Tournament.find(params[:tournament_id])
    @team = @tournament.teams.find(params[:team_id])
    @player = @team.players.new
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @team = @tournament.teams.find(params[:team_id])
    @player = @team.players.new(player_params)

    if @player.save
      redirect_to tournament_team_path(@tournament, @team),
                  notice: "Player created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.require(:player).permit(
      :name,
      :surname,
      :number,
      :position,
      :date_of_birth
    )
  end
end
