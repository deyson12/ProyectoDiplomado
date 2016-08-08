Rails.application.routes.draw do
  resources :tokens
  resources :appointments
  resources :type_appointments
  resources :users
  resources :type_identifications
  resources :doctors
  resources :clinics
  resources :estates
  resources :level_doctors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
