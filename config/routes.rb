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
  get '/bakeries/new', to: 'bakeries#new'
  post '/bakeries', to: 'bakeries#create'
  get '/bakeries/:id', to: 'bakeries#show'
  get '/bakeries/:id/edit', to: 'bakeries#edit'
  patch '/bakeries/:id', to: 'bakeries#update'



  #goods

  get '/goods', to: 'goods#index'
  get '/goods/:id', to: 'goods#show'

  #bakerygoods\
  get '/bakeries/:id/goods', to: 'bakery_goods#index'
  get '/bakeries/:id/goods/new', to: 'bakery_goods#new'
  post '/bakeries/:id/goods', to: 'bakery_goods#create'
end
