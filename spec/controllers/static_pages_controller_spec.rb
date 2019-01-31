require 'rails_helper'

describe StaticPagesController do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #contact" do
  #   it "returns http success" do
  #     get :contact
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #concept" do
    it "returns http success" do
      get :concept
      expect(response).to have_http_status(:success)
    end
  end
end
