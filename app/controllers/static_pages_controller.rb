class StaticPagesController < ApplicationController
  def home
    @shops = Shop.page(params[:page]).per(9).like_num
  end
  
  def about
    @shops = Shop.page(params[:page]).per(9).like_num
  end

  def help
  end

  def concept
  end
end
