# == Route Map
#
#   Prefix Verb   URI Pattern          Controller#Action
#     root GET    /                    pages#home
#    users POST   /users(.:format)     users#create
# new_user GET    /users/new(.:format) users#new
#    login GET    /login(.:format)     session#new
#          POST   /login(.:format)     session#create
#          DELETE /login(.:format)     session#destroy
#

Rails.application.routes.draw do
  get 'categories/index'

  root :to => 'pages#home'

  resources :recipes
  resources :users, :only => [:new, :create]

    get '/login' => 'session#new'
    post '/login' => 'session#create'
    delete '/login' => 'session#destroy'

  get 'categories' => 'categories#index'


end
