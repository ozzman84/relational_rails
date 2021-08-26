Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Guests
  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'

  ##Beds
  get '/beds', to: 'beds#index'
  get '/beds/:id', to: 'beds#show'
  get '/beds/:id/guests', to: 'beds#guests_index'
end
