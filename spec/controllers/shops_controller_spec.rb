require 'rails_helper'

describe ShopsController do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      shop = create(:shop)
      get :show, params: {id: shop.id}
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #new" do
    # ログイン済みのユーザー＆管理者としてアクセス可能
    it "accesses to shop new page as a login and admin user" do
      user = create(:user, admin_flg: true)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
    
    # ログイン済みでも管理者でないならアクセス不可能
    it "does not access to shop new page as a non-admin user" do
      user = create(:user, admin_flg: false)
      sign_in user
      get :new
      expect(response).to have_http_status('302')
      expect(response).to redirect_to(root_url)
    end
    
    # ログインしてないゲストでアクセス不可能
    it "does not access to shop new page as a guest" do
      get :new
      expect(response).to have_http_status('302')
      expect(response).to redirect_to(root_url)
    end
  end
  
  describe "POST #create" do
    # ログイン済みのユーザー＆管理者として店舗の新規登録が可能
    it "creates a new shop as a login and admin user" do
      user = create(:user, admin_flg: true)
      sign_in user
      shop_params = attributes_for(:shop)
      expect{post :create, params: {shop: shop_params}}.to change(Shop, :count).by(1)

    end
    
    # ログイン済みでも管理者でないなら店舗の新規登録は不可能
    it "does not creates a new shop as a non-admin user" do
      user = create(:user, admin_flg: false)
      sign_in user
      shop_params = attributes_for(:shop)
      expect{post :create, params: {shop: shop_params}}.to_not change(Shop, :count)
      expect(response).to redirect_to(root_url)
    end
    
    # ログインしてないゲストで店舗の新規登録は不可能
    it "does not creates a new shop as a guest" do
      shop_params = attributes_for(:shop)
      expect{post :create, params: {shop: shop_params}}.to_not change(Shop, :count)
      expect(response).to redirect_to(root_url)
    end
  end

  describe "GET #edit" do
  
    before do
      @shop = create(:shop)
    end

    # ログイン済みのユーザー＆管理者としてアクセス可能
    it "accesses to shop edit page as a login and admin user" do
      user = create(:user, admin_flg: true)
      sign_in user
      get :edit, params: {id: @shop.id}
      expect(response).to have_http_status(:success)
    end
    
    # ログイン済みでも管理者でないならアクセス不可能
    it "does not access to shop edit page as a non-admin user" do
      user = create(:user, admin_flg: false)
      sign_in user
      get :edit, params: {id: @shop.id}
      expect(response).to have_http_status('302')
      expect(response).to redirect_to(root_url)
    end
    
    # ログインしてないゲストでアクセス不可能
    it "does not access to shop edit page as a guest" do
      get :edit, params: {id: @shop.id}
      expect(response).to have_http_status('302')
      expect(response).to redirect_to(root_url)
    end
  end
  
  describe "PATCH #update" do

    before do
      @shop = create(:shop)
    end

    # ログイン済みのユーザー＆管理者として店舗情報の更新が可能
    it "updates shop information as a login and admin user" do
      user = create(:user, admin_flg: true)
      sign_in user
      patch :update, params: {id: @shop.id, shop: attributes_for(:shop)}
      expect(response).to redirect_to shop_url(@shop.id)
      expect(flash[:success]).to eq "店舗の編集に成功しました。"
    end
    
    # ログイン済みでも管理者でないなら店舗情報の更新は不可能
    it "does not update shop information as a non-admin user" do
      user = create(:user, admin_flg: false)
      sign_in user
      patch :update, params: {id: @shop.id, shop: attributes_for(:shop)}
      expect(flash[:danger]).to eq "このページにアクセスする権限がありません。"
    end
    
    # ログインしてないゲストで店舗情報の更新は不可能
    it "does not update shop information as a guest" do
      patch :update, params: {id: @shop.id, shop: attributes_for(:shop)}
      expect(flash[:danger]).to eq "このページにアクセスする権限がありません。"
    end
  end

  describe "DELETE #destroy" do

    before do
      @shop = create(:shop)
    end
    
    # ログイン済みのユーザー＆管理者として店舗情報の削除が可能
    it "desletes a shop information as a login and admin user" do
      user = create(:user, admin_flg: true)
      sign_in user
      expect{delete :destroy, params: {id: @shop.id}}.to change(Shop, :count).by(-1)
    end
    
    # ログイン済みでも管理者でないなら店舗情報の削除は不可能
    it "does not deslete a shop information as a non-admin user" do
      user = create(:user, admin_flg: false)
      sign_in user
      delete :destroy, params: {id: @shop.id}
      expect{delete :destroy, params: {id: @shop.id}}.to_not change(Shop, :count)
      expect(response).to redirect_to(root_url)
    end
    
    # ログインしてないゲストで店舗情報の削除は不可能
    it "does not delete a shop information as a guest" do
      delete :destroy, params: {id: @shop.id}
      expect{delete :destroy, params: {id: @shop.id}}.to_not change(Shop, :count)
      expect(response).to redirect_to(root_url)
    end
  end
end