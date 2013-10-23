HamptonsfooddeliveryApp::Application.routes.draw do

# resources :hamptons
resources :restaurants
resources :orders
resources :posts
resources :users, except: [:index]
resources :sessions, only: [:new, :create]

root to: 'hamptons#index'

get '/', to: 'hamptons#index'

get '/hamptons', to: 'hamptons#index'

get '/restaurants/new', to: 'restaurants#new'

get '/restaurants', to: 'restaurants#index'

get '/restaurants/:id', to:'restaurants#show'


# get '/hamptons/new', to: 'hamptons#new'

get "/logout", to: "sessions#destroy"

get "/hamptons/about", to: "hamptons#about"

get "/hamptons/contact", to: "hamptons#contact"


end
