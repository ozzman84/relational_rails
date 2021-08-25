Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Beds
  get '/beds', to: 'beds#index'
  get '/beds/:id', to: 'beds#show'

  ##Guests
  get '/guests', to: 'guests#index'
  get '/guests', to: 'guests#show'
end
