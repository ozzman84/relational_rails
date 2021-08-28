class BakeriesController < ApplicationController
  def index
    @bakeries = Bakery.ordered_creation
  end

  def show
    @bakery = Bakery.find(params[:id])
  end
end
