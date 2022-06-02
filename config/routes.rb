Rails.application.routes.draw do
  resources :sessions
  resources :signins
  resources :tallies
  resources :votes
  resources :electoral_positions
  resources :election_periods
  resources :candidates
  resources :counting_stations
  resources :pictures
  resources :observers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
