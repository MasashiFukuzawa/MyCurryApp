class LikesController < ApplicationController
  before_action :set_shop, only: :create

  def index
    @likes = current_user.likes.all.desc
  end

  def create
    @like = current_user.likes.find_by(shop: @shop)
    toggle
  end

  private

    def toggle
      if @like
        return head :unprocessable_entity unless @like.destroy
      else
        @like = current_user.likes.build(shop: @shop)
        return head :unprocessable_entity unless @like.save
      end
      head :ok
    end

    def set_shop
      @shop = Shop.find(params[:shop_id])
    end
end