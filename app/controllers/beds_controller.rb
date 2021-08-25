class BedsController < ApplicationController
  def index
    @beds = Bed.all
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
