class BedGuestsController < ApplicationController
  def index
    @bed_guests = Bed.find(params[:id]).guests
  end
end
