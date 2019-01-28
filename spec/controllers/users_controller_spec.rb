require 'rails_helper'

describe UsersController do

  describe "GET #show" do
    it "returns http success" do
      user = FactoryBot.create(:user)
      get :show, params: {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end
end
