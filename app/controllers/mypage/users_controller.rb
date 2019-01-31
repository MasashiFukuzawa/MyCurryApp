class Mypage::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?, only: [:show]

  def show
    @comments = current_user.comments.page(params[:page]).per(10).desc
  end
end