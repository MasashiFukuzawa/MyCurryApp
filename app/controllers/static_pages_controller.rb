class StaticPagesController < ApplicationController
  before_action :shop_index, only: [:home, :about]
  
  def home
  end
  
  def about
  end

  def help
  end

  def concept
  end

  private

    def shop_index
      @shops = Shop.page(params[:page]).per(9).like_num
    end
end
