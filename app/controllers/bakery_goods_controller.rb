class BakeryGoodsController < ApplicationController
  def index
    @bakery = Bakery.find(params[:id])
    @goods = @bakery.goods
    if params[:order] == "name"
      @goods = @goods.sort_alpha
    else
      @goods = @bakery.goods
    end
  end

  def new
    @bakery = Bakery.find(params[:id])
  end

  def create
    @bakery = Bakery.find(params[:id])
    @bakery.goods.create!(good_params)
    redirect_to "/bakeries/#{@bakery.id}/goods"
  end

  def good_params
    params.permit(:name, :category, :days_old, :gluten_free)
  end
end
