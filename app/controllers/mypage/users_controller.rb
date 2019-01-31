class Mypage::UsersController < ApplicationController
  def show
    @comments = current_user.comments.page(params[:page]).per(10).desc
  end
end