Rails.application.routes.draw do
  get "stories/index"
  get "/auth/:provider/callback", to: "sessions#omniauth"
  get "/auth/failure", to: "sessions#auth_failure"
  delete "logout", to: "sessions#destroy", as: :logout

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :stories, only: [ :index, :new, :create, :show, :destroy ] do
    member do
      patch "set_status"
    end
  end

  root "home#index"
end
