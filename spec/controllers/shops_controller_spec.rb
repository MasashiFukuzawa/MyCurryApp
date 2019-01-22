require 'rails_helper'

RSpec.describe ShopsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      shop = FactoryBot.create(:shop)
      get :show, params: {id: shop.id}
      expect(response).to have_http_status(:success)
    end
  end

end
