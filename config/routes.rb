Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  ##Guests
  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'

  ##Beds
  get '/beds', to: 'beds#index'
  get '/beds/:id', to: 'beds#show'
  get '/beds/:id/guests', to: 'beds#guests_index'


    #bakery

  get '/bakeries', to: 'bakeries#index'
  get '/bakeries/:id', to: 'bakeries#show'

  #goods

  get '/goods', to: 'goods#index'
  get '/goods/:id', to: 'goods#show'

  #bakerygoods
  get '/bakeries/:id/goods', to: 'bakerygoods#index'
end
