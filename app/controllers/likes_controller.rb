class LikesController < ApplicationController
  before_action :set_variables, except: :index

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
    @shop = Shop.likes.find(params[:id])
    @shop.likes.find_by(user_id: current_user.id).destroy
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  private

    def set_variables
      @shop = shop.find(params[:shop_id])
      @id_name = "#like-link-#{@shop.id}"
    end
end