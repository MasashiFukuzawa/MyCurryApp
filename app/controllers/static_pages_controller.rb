class StaticPagesController < ApplicationController
  def home
    @shops = Shop.page(params[:id]).per(6)
  end

  def about
  end

  def help
  end

  def contact
  end
end
