Rails.application.routes.draw do
  get 'sessions/new'

  resources :user_logins
  resources :level_doctors
  resources :estates
  resources :clinics
  resources :doctors
  resources :type_identifications
  resources :users
  resources :type_appointments
  resources :appointments

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
