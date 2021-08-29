class BakeriesController < ApplicationController
  def index
    @bakeries = Bakery.ordered_creation
  end

  def show
    @bakery = Bakery.find(params[:id])
  end

  def new
  end

  def create
    bakery = Bakery.create(bakery_params)
    redirect_to '/bakeries'
  end

  def edit
    @bakery = Bakery.find(params[:id])
  end

  def update
    bakery = Bakery.find(params[:id])
    bakery.update(bakery_params)
    redirect_to '/bakeries'
  end

  def bakery_params
    params.permit(:name,:city,:delivery,:review)
  end
end
