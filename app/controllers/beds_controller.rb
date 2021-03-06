class BedsController < ApplicationController
  def index
    @beds = Bed.all.order(:created_at)
  end

  def guests_index
    @bed = Bed.find(params[:id])
    if params[:sort]
      @bed_guests = Bed.find(params[:id]).guests.currently_visiting.name_asc
    elsif params[:filter]
      @bed_guests = Bed.find(params[:id]).guests.currently_visiting.threshold(params[:filter])
    else
      @bed_guests = Bed.find(params[:id]).guests.currently_visiting
    end
  end

  def new
    @bed = Bed.new
  end

  def show
    @bed = Bed.find(params[:id])
  end

  def create
    bed = Bed.create!(bed_params)
    redirect_to "/beds"
  end

  def edit
    @bed = Bed.find(params[:id])
  end

  def update
    bed = Bed.find(params[:id])
    bed.update(bed_params)
    redirect_to '/beds'
  end

  def destroy
    bed = Bed.find(params[:id])
    bed.destroy
    redirect_to "/beds"
  end

  private

  def bed_params
    params.permit(:name, :occupied, :guest_count)
  end
end
