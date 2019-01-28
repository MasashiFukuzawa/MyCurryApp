class Mypage::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?, only: [:show]
  before_action :correct_user,   only: [:show]

  def show
    @comments = current_user.comments.page(params[:page]).per(10).desc
  end

  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end