class BedsController < ApplicationController
  def index
    @beds = Bed.all.order(:created_at) #move order to Model.
  end

  def guests_index
    @bed = Bed.find(params[:id])
    @bed_guests = Bed.find(params[:id]).guests #refactor and move to BedGuestsController
  end

  def new
    @bed = Bed.new
  end

  def show
    @bed = Bed.find(params[:id])
  end

  def create
    bed = Bed.create!({
      name: params[:name],
      occupied: params[:occupied],
      guest_count: params[:guest_count]
    })
    redirect_to "/beds"
  end
end
