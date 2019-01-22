class ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(30)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private

    def shops_params
      params.require(shops).permit(:name, :phone, :address, :area, :station)
    end
end