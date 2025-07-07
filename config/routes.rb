Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get "static_pages/privacy"
  get "static_pages/terms"
  resource :contact, only: [ :new, :create ]

  get "stories/index"
  get "/auth/:provider/callback", to: "sessions#omniauth"
  get "/auth/failure", to: "sessions#auth_failure"
  delete "logout", to: "sessions#destroy", as: :logout

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :stories do
    member do
      patch "set_status"
    end
    resources :plots, only: [ :new, :create, :edit, :update, :destroy ]
    resources :world_guides, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
    resources :characters, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
    resources :flags, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
    resources :character_features, only: [ :show, :edit, :update ]
    resources :world_guide_features, only: [ :show, :edit, :update ]
    resources :character_relationships, only: [ :show, :edit, :update ]
  end

  root "home#index"

  namespace :admin do
    root to: "dashboard#index"
    resources :users, only: [ :index, :edit, :update, :destroy ]
    resources :stories, only: [ :index, :destroy ]
  end
end
