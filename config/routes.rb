Rails.application.routes.draw do
  get "stories/index"
  get "/auth/:provider/callback", to: "sessions#omniauth"
  get "/auth/failure", to: "sessions#auth_failure"
  delete "logout", to: "sessions#destroy", as: :logout

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :stories, only: [ :index, :new, :create, :show, :destroy, :edit, :update ] do
    member do
      patch "set_status"
    end
    resources :plots, only: [ :new, :create, :edit, :update, :destroy ]
    resources :world_guides, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
    resources :characters, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
    resources :flags, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
  end

  root "home#index"

  namespace :admin do
    get "stories/index"
    get "stories/destroy"
    root to: "dashboard#index"
    resources :users, only: [ :index, :edit, :update, :destroy ]
    resources :stories, only: [ :index, :destroy ]
  end
end
