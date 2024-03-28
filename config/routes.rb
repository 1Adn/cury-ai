Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/cv', to: 'pages#cv'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users
  resources :job_offers do
    resources :cv_generations, only: [:new, :create]
  end

  resources :cv_generations, except: [:new, :create] do
    resources :cvs, only: :create
  end

  resources :profiles, only: [:new, :show, :edit, :update, :create]
  resources :cvs, only: :show
  get "user/dashboard", to: "pages#dashboard"
  resources :skills, only: [:create, :update, :destroy]
  resources :experiences, only: [:create, :update, :destroy]
  resources :degrees, only: [:create, :update, :destroy]
  resources :languages, only: [:create, :update, :destroy]

    # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
end
