Rails.application.routes.draw do
  post '/signup',       to: 'users#create'
  post '/login',        to: 'authentication#login'
  post '/verify_token', to: 'authentication#verify_token'

  resources :users, only: [ :index ]
end
