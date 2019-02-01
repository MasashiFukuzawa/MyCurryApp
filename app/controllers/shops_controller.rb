class ShopsController < ApplicationController

  MAX_PER_PAGE = 30
  MIN_PER_PAGE = 5
  
  def index
    @shops = Shop.page(params[:page]).per(MAX_PER_PAGE).search(params[:search]).like_num.comment_num
  end

  def show
    @shop = Shop.find(params[:id])
    @comments = @shop.comments.page(params[:page]).per(MIN_PER_PAGE).desc
  end

  private

    def shops_params
      params.require(shop).permit(:name, :phone, :image, :address, :area, :station, :url, :twiiter_url, :facebook_url, tabelog_url, :google_map_url)
    end
end