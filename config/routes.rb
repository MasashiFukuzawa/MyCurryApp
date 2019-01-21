Rails.application.routes.draw do
  root 'static_pages#home'
  %w(about help contact concept).each do |path|
    get path, to: "static_pages##{path}"
  end
  resources :shops, only: [:index, :show]
end
