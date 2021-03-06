Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Welcome
  get '/', to: 'welcome#index'

  ##Guests
  get '/guests', to: 'guests#index'
  get '/guests/:id/edit', to: 'guests#edit'
  get '/guests/:id', to: 'guests#show'
  patch '/guests/:id', to: 'guests#update'
  delete '/guests/:id', to: 'guests#destroy'

  ##BedGuests
  # get '/bedguests/:id/guests', to: 'bedguests#index'
  get '/beds/:id/guests/new', to: 'guests#new'
  post '/beds/:id/guests', to: 'guests#create'

  ##Beds
  get '/beds', to: 'beds#index'
  get '/beds/new', to: 'beds#new'
  post '/beds', to: 'beds#create'
  get '/beds/:id/edit', to: 'beds#edit'
  get '/beds/:id', to: 'beds#show'
  patch '/beds/:id', to: 'beds#update'
  delete '/beds/:id', to: 'beds#destroy'

  ##BedGuests
  get '/beds/:id/guests', to: 'beds#guests_index'

  ##bakery
  get '/bakeries', to: 'bakeries#index'
  get '/bakeries/new', to: 'bakeries#new'
  post '/bakeries', to: 'bakeries#create'
  get '/bakeries/:id', to: 'bakeries#show'
  get '/bakeries/:id/edit', to: 'bakeries#edit'
  patch '/bakeries/:id', to: 'bakeries#update'
  delete '/bakeries/:id', to: 'bakeries#destroy'



  #goods

  get '/goods', to: 'goods#index'
  get '/goods/:id', to: 'goods#show'
  get '/goods/:id/edit', to: 'goods#edit'
  patch '/goods/:id', to: 'goods#update'
  delete '/goods/:id', to: 'goods#destroy'


  #bakerygoods\
  get '/bakeries/:id/goods', to: 'bakery_goods#index'
  get '/bakeries/:id/goods/new', to: 'bakery_goods#new'
  post '/bakeries/:id/goods', to: 'bakery_goods#create'
end
