class ShopsController < ApplicationController

  MAX_PER_PAGE = 30
  MIN_PER_PAGE = 5
  
  def index
    @shops = Shop.page(params[:page]).per(MAX_PER_PAGE)
  end

  def show
    @shop = Shop.find(params[:id])
    @comments = @shop.comments.page(params[:page]).per(MIN_PER_PAGE).desc
    @comment = current_user.comments.build if user_signed_in?
  end

  private

    def shops_params
      params.require(shop).permit(:name, :phone, :image, :address, :area, :station, :url, :twiiter_url, :facebook_url, tabelog_url, :google_map_url)
    end
end