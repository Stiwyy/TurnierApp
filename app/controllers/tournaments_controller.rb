# frozen_string_literal: true

class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to @tournament, notice: "Tournament was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def tournament_params
    params.require(:tournament).permit(:name, :location, :start_time, :end_time)
  end
end