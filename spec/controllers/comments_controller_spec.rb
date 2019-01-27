require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before do
    user = FactoryBot.create(:user)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show, params: {id: comment.id}
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  
  # describe "POST #create" do
  #   it "returns http success" do
  #     post :create, params: {id: comment.id}
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  
  # describe "DELETE #destroy" do
  #   it "returns http success" do
  #     delete :destroy, params: {id: comment.id}
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
