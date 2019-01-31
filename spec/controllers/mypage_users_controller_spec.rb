require 'rails_helper'

describe Mypage::UsersController do

  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
  end
  
  # 認証済みのユーザーとして
  context "as an authenticated user" do
    # 正常にレスポンスを返すこと
    it "returns http success" do
      sign_in @user
      get :show, params: {id: @user.id}
      expect(response).to have_http_status(:success)
    end
  end
  
  # ゲストとして
  context "as a guest" do
    # 302レスポンスを返すこと
    it "returns a 302 response" do
      get :show, params: {id: @user.id}
      expect(response).to have_http_status "302"
    end
    
    # サインイン画面にリダイレクトすること
    it "redirects to the sign-in page" do
      get :show, params: {id: @user.id}
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end
