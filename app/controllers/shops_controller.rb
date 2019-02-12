class ShopsController < ApplicationController
  before_action :admin_user?, except: [:index, :show]
  before_action :find_shop, only: [:show, :edit, :update, :destroy]

  MAX_PER_PAGE = 30
  MIN_PER_PAGE = 5
  
  def index
    @shops = Shop.page(params[:page]).per(MAX_PER_PAGE).search(params[:search]).assess_num
  end

  def show
    @comments = @shop.comments.page(params[:page]).per(MIN_PER_PAGE).desc
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shops_params)
    if @shop.save
      flash[:success] = "店舗の登録に成功しました。"
      redirect_to @shop
    else
      flash[:danger] = "店舗の登録に失敗しました。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @shop.update_attributes(shops_params)
      flash[:success] = "店舗の編集に成功しました。"
      redirect_to @shop
    else
      flash[:danger] = "店舗の編集に失敗しました。"
      render 'edit'
    end
  end
  
  def destroy
    @shop.destroy
    flash[:success] = "店舗情報を削除しました。"
    redirect_to root_url
  end

  private
  
    def shops_params
      params.require(:shop).permit(
        :name, 
        :phone, 
        :image, 
        :address, 
        :area, 
        :station, 
        :url, 
        :twiiter_url, 
        :facebook_url, 
        :tabelog_url, 
        :google_map_url, 
        :access,
        :business_hour,
        :holiday)
    end

    def find_shop
      @shop = Shop.find(params[:id])
    end

    def admin_user?
      unless user_signed_in? && current_user.admin_flg?
        flash[:danger] = "このページにアクセスする権限がありません。"
        redirect_to root_url
      end
    end
end