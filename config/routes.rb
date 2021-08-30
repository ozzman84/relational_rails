Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Welcome
  get '/', to: 'welcome#index'

  ##Guests
  get '/guests', to: 'guests#index'
  get '/guests/:id/edit', to: 'guests#edit'
  patch '/guests/:id', to: 'guests#update'
  get '/guests/:id', to: 'guests#show'

  ##BedGuests
  # get '/bedguests/:id/guests', to: 'bedguests#index'
  get '/beds/:id/guests/new', to: 'guests#new'
  post '/beds/:id/guests', to: 'guests#create'

  ##Beds
  get '/beds', to: 'beds#index'
  get '/beds/new', to: 'beds#new'
  post '/beds', to: 'beds#create'
  get '/beds/:id/edit', to: 'beds#edit'
  patch '/beds/:id', to: 'beds#update'
  get '/beds/:id', to: 'beds#show'

  ##BedGuests
  get '/beds/:id/guests', to: 'beds#guests_index'

  ##bakery
  get '/bakeries', to: 'bakeries#index'
end
