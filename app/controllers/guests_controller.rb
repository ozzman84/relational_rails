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
    @beds = Beds.find(params[:id])
    guest = @beds.guests.create!({
      first_name: params[:first_name],
      last_name: params[:last_name],
      rent: params[:rent],
      visiting: params[:visiting]
    })
    guest.save
    redirect_to "/beds/#{@beds}/guests"
  end
end
