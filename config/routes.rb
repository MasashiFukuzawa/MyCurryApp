Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
  get 'users/show'
  get 'users/edit'
  root 'static_pages#home'
  %w(about help contact concept).each do |path|
    get path, to: "static_pages##{path}"
  end
  resources :shops, only: [:index, :show]
end
