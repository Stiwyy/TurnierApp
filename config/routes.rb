Rails.application.routes.draw do
  root "main#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :tournaments, only: [:index, :show] do
    resources :teams, only: [:index, :show]
    resources :games, only: [:index]
  end
end