Rails.application.routes.draw do
  root 'static_pages#home'
  %w(about help concept).each do |path|
    get path, to: "static_pages##{path}"
  end

  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
  
  resources :users, only: :show
  namespace :mypage do
    resources :users, only: :show
  end
  
  resources :shops, only: [:index, :show]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:index, :create, :destroy]
end