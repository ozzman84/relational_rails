class BedsController < ApplicationController
  def index
    @beds = Bed.all.order(:created_at)
  end

  def guests_index
    @bed = Bed.find(params[:id])
    @bed_guests = Bed.find(params[:id]).guests
  end

  def show
    @bed = Bed.find(params[:id])
  end

  def new

  end

  def create
    bed = Bed.new({
      name: params[:bed][:name],
      occupied: params[:bed][:occupied],
      guest_count: params[:bed][:guest_count],
    })
    bed.save
    redirect_to "/beds"
  end
end
