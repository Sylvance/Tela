Rails.application.routes.draw do
  resources :dashboards
  resources :political_parties
  resources :admins
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
  root "dashboards#index"
  get 'dashboards_by_counting_station', to: 'dashboards#by_counting_station'
  get 'dashboards_by_candidate', to: 'dashboards#by_candidate'
  get 'dashboards_by_electoral_position', to: 'dashboards#by_electoral_position'
  get 'dashboards_by_election_period', to: 'dashboards#by_election_period'
end
