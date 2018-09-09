Rails.application.routes.draw do
  # websocket
  mount ActionCable.server => '/cable'

  # auth
  post '/signup',       to: 'users#create'
  post '/login',        to: 'authentication#login'
  post '/verify_token', to: 'authentication#verify_token'

  resources :users, only: [ :index ]
end
