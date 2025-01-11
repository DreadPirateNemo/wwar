Rails.application.routes.draw do
  root "main#index"
  get "sign_up" => "registrations#new", as: :new_registration
  post "registration/create" => "registrations#create", as: :registration
  resource :session, except: [:new, :destroy]
  get "login" => "sessions#new", as: :new_session
  delete "logout" => "sessions#destroy"
  resource :registration, only: %i[new create]
  resources :passwords, param: :token

  get "dashboard" => "dashboard#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"



end
