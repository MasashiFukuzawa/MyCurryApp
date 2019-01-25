class ShopsController < ApplicationController

  MAX_PER_PAGE = 30
  
  def index
    @shops = Shop.page(params[:page]).per(MAX_PER_PAGE)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private

    def shops_params
      params.require(shops).permit(:name, :phone, :address, :area, :station)
    end
end