class LikesController < ApplicationController
  before_action :set_id_tag, except: :index

  def index
    @likes = current_user.likes.all.desc
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @shop.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end
  
  def destroy
    @shop = Shop.find(params[:shop_id])
    @shop.likes.find_by(user_id: current_user.id).destroy
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  private

    def set_id_tag
      @shop = Shop.find(params[:shop_id])
      @id_name = "#like-link-#{@shop.id}"
    end
end