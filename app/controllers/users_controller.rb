class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.page(params[:page]).per(10).desc
    @likes = @user.likes.all.desc
  end
end
