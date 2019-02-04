require 'rails_helper'

describe LikesController do
  describe "GET #index" do
    # ログイン済みのユーザーとして
    context "as an authenticated user" do
      it "returns http success" do
        user = create(:user)
        sign_in user
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    
    # ログインしてないゲストユーザーとして
    context "as an guest user" do
      # いいね！一覧ページにアクセスするとエラーが発生すること
      it "does not access to like index page and gets an error" do
        expect {get :index}.to raise_error NoMethodError
      end
    end
  end

  describe "POST #create" do
    # ログイン済みのユーザーとして
    context "as an authenticated user" do
      before do
        @user = create(:user)
        @shop = create(:shop)
      end
      
      it "returns http success" do
        sign_in @user
        post :create, params: {user_id: @user.id, shop_id: @shop.id}
        expect(response).to have_http_status(:success)
      end
      
      # いいね！が出来ること
      it "creates a like" do
        sign_in @user
        expect {post :create, params: {user_id: @user.id, shop_id: @shop.id}}.to change(@user.likes, :count).by(1)
      end
      
      # いいね！の取り消しが出来ること
      it "destroys a like" do
        sign_in @user
        post :create, params: {user_id: @user.id, shop_id: @shop.id}
        expect {post :create, params: {user_id: @user.id, shop_id: @shop.id}}.to change(@user.likes, :count).by(-1)
      end
    end
    
    # ログインしてないゲストユーザーとして
    context "as an guest user" do
      before do
        @user = create(:user)
        @shop = create(:shop)
      end
      
      # いいね！しようとするとエラーが発生すること
      it "does not create like for a shop and gets an error" do
        expect {post :create, params: {user_id: @user.id, shop_id: @shop.id}}.to raise_error NameError
      end
    end
  end
end