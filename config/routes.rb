Rails.application.routes.draw do
  get 'athletes/new'
  post 'athletes/create'
  get 'coaches/new'
  post 'coaches/create'
  get "sessions/new"
  post "sessions/create"
  post 'sessions/destroy'
  resources :coach_sports
  resources :athlete_sports
  resources :sports
  resources :athletes
  resources :programs
  resources :coaches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
