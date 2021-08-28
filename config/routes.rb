Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Welcome
  get '/', to: 'welcome#index'

  ##Guests
  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'

  ##BedGuests
  # get '/bedguests/:id/guests', to: 'bedguests#index'

  ##Beds
  get '/beds', to: 'beds#index'
  get '/beds/new', to: 'beds#new'
  post '/beds', to: 'beds#create'
  get '/beds/:id', to: 'beds#show'

  ##BedGuests
  get '/beds/:id/guests', to: 'beds#guests_index'

  ##bakery
  get '/bakeries', to: 'bakeries#index'
end
