class CommentsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.shop_id = params[:shop_id]
    if @comment.save
      flash[:success] = "コメントが投稿されました。"
      redirect_back(fallback_location: root_url)
    else
      flash[:danger] = "投稿失敗しました。"
      redirect_back(fallback_location: root_url)
    end
  end
  
  def destroy
    current_user.comments.find_by(id: params[:id]).destroy
    flash[:success] = "投稿を削除しました。"
    redirect_back(fallback_location: root_url)
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:body, :image)
    end
end