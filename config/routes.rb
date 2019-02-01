Rails.application.routes.draw do
  root 'static_pages#home'
  %w(about help concept).each do |path|
    get path, to: "static_pages##{path}"
  end

  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
  resources :users, only: :show
  
  resources :shops, only: [:index, :show] do
    resources :comments, only: [:create]
  end
  resources :comments, only: :destroy
  resources :likes, only: [:index, :create]
end