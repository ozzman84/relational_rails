class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
    @bed = Bed.find(params[:id])
  end

  def create
    bed = Bed.find(params[:id])
    guest = bed.guests.create!(guest_params)
    redirect_to "/beds/#{bed.id}/guests"
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    guest = Guest.find(params[:id])
    guest.update(guest_params)
    redirect_to "/guests/#{guest.id}"
  end

  def destroy
    guest = Guest.find(params[:id])
    guest.destroy
    redirect_to "/guests"
  end

  private

  def guest_params
    params.permit(:first_name, :last_name, :rent, :visiting)
  end
end
