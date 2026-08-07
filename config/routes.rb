Rails.application.routes.draw do
  root "main#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :tournaments, only: [:index, :show, :new, :create] do
    resources :teams, only: [:index, :show, :new, :create] do
      resources :players, only: [:new, :create] do
    end
    resources :games, only: [:index, :new, :create]
  end
  end
end