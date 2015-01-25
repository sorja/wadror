Rails.application.routes.draw do
  resources :beers

  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]

  root 'breweries#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # get '/', to: 'breweries#index'
  # root 'breweries#index'

  # Example path:
  # get( 'kaikki_bisset', { :to => 'beers#index' } )
  # get 'kaikki_bisset', to: 'beers#index'

  #get( 'ratings', {:to => 'beers#index' } )
  # get 'ratings', to: 'ratings#index'
  #New rate
  # get 'ratings/new', to:'ratings#new'
  #New rate requires post method
  # post 'ratings', to: 'ratings#create'

end
