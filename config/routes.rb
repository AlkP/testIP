require 'resque/server'

Rails.application.routes.draw do
  root 'addresses#index'

  get '/ping', to: 'main#ping', as: 'ping'
  get '/filter', to: 'main#filter', as: 'filter'
  post '/data_request', to: 'main#data_request', as: 'data_request'

  resources :addresses

  mount Resque::Server.new, at: "/resque"
end