class BakeryGoodsController < ApplicationController
  def index
    @bakery = Bakery.find(params[:id])
    @goods = @bakery.goods
  end
end
