require 'rails_helper'

describe CommentsController do
  describe "POST #create" do
    # 認証済みのユーザーとして
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end
      
      # 有効な属性値の場合
      context "with valid attributes" do
        # コメントを追加できること
        it "adds a comment" do
          comment_params = FactoryBot.attributes_for(:comment, user_id: @user.id)
          sign_in @user
          expect {post :create, params: {shop_id: @shop.id, comment: comment_params}}.to change(@user.comments, :count).by(1)
        end
      end
      
      # 無効な属性値の場合
      context "with invalid attributes" do
        # コメントを追加できないこと
        it "does not add a comment" do
          comment_params = FactoryBot.attributes_for(:comment, user_id: @user.id)
          sign_in @user
          expect{post :create, params: {shop_id: @shop.id, comment: comment_params}}.to change(@user.comments, :count)
        end
      end
    end
    
    # # ゲストとして
    # context "as a guest" do
    #   before do
    #     @user = FactoryBot.create(:user)
    #     @shop = FactoryBot.create(:shop)
    #   end
    #   # 302レスポンスを返すこと
    #   it "returns a 302 response" do
    #     comment_params = FactoryBot.attributes_for(:comment, user_id: @user.id)
    #     post :create, params: {shop_id: @shop.id, comment: comment_params}
    #     expect(response).to have_http_status "302"
    #   end
      
    #   # サインイン画面にリダイレクトすること
    #   it "redirects to the sign-in page" do
    #     comment_params = FactoryBot.attributes_for(:comment, user_id: @user.id)
    #     post :create, params: {shop_id: @shop.id, comment: comment_params}
    #     expect(response).to redirect_to "/users/sign_in"
    #   end
    # end
  end
  
  describe "DELETE #destroy" do
    # 認可されたユーザーとして
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
        @comment = FactoryBot.create(:comment, user_id: @user.id, shop_id: @shop.id)
      end
      
      # コメントを削除できること
      it "deletes a comment" do
        sign_in @user
        expect{delete :destroy, params: {id: @comment.id}}.to change(@user.comments, :count).by(-1)
      end
    end
    
    # 認可されていないユーザーとして
    context "as an unauthenticated user" do
      before do
        @user = FactoryBot.create(:user)
        @other_user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
        @comment = FactoryBot.create(:comment, user_id: @other_user.id, shop_id: @shop.id)
      end
      
      # コメントを削除できないこと
      it "does not delete a comment" do
        sign_in @other_user
        expect{delete :destroy, params: {id: @comment.id}}.to_not change(@user.comments, :count)
      end
      
        # ホーム画面にリダイレクトすること
      it "redirects to the dashboard" do
        sign_in @other_user
        delete :destroy, params: {id: @comment.id}
        expect(response).to redirect_to root_path
      end
    end
    
    # # ゲストとして
    # context "as a guest" do
    #   before do
    #     @user = FactoryBot.create(:user)
    #     @shop = FactoryBot.create(:shop)
    #     @comment = FactoryBot.create(:comment, user_id: @user.id, shop_id: @shop.id)
    #   end
      
    #     # 302レスポンスを返すこと
    #   it "returns a 302 response" do
    #     delete :destroy, params: {id: @comment.id}
    #     expect(response).to have_http_status "302"
    #   end
      
    #     # サインイン画面にリダイレクトすること
    #     it "redirects to sign-in page" do
    #       delete :destroy, params: {id: @comment.id}
    #       expect(response).to redirect_to "/users/sign_in"
    #     end

    #   # コメントを削除できないこと
    #   it "does not delete the comment" do
    #     expect{delete :destroy, params: {id: @comment.id}}.to_not change(@comment, :count)
    #   end
    # end
  end
end
