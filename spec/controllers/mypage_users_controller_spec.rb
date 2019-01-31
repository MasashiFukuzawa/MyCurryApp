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
end
