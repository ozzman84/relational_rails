class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    bed = Beds.find(params[:id])
    guest = bed.guests.create!({
      first_name: params[:first_name],
      last_name: params[:last_name],
      rent: params[:rent],
      visiting: params[:visiting]
    })
    redirect_to "/beds/#{bed.id}/guests"
  end
end
