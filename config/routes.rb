Rails.application.routes.draw do
  root 'users#home'
  get '/about', to: 'users#about'
  get '/help', to: 'users#help'
  get '/contact', to: 'users#contact'
end
