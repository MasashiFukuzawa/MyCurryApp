class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def show
    @comments = Comment.shop.where(params[:id])
  end

  def create
    
  end
  
  def destroy
  end

  private

    def comments_params
      params.require(:comment).permit(:title, :body, :image_data)
    end
end