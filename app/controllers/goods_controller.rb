class GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def show
    @good = Good.find(params[:id])
  end


  def edit
    @good = Good.find(params[:id])
  end

  def update
    good = Good.find(params[:id])
    good.update!(good_params)
    redirect_to "/goods/#{good.id}"
  end

  private
  def good_params
    params.permit(:name,:category,:days_old, :gluten_free)
  end
end
