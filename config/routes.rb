Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
  resources :users, only: :show
  resources :shops, only: [:index, :show]
  resources :comments, only: [:new, :show, :create, :destroy]
  root 'static_pages#home'
  %w(about help contact concept).each do |path|
    get path, to: "static_pages##{path}"
  end
end