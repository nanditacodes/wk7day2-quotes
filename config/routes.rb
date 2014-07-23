Rails.application.routes.draw do
  devise_for :users
  root to: 'quotes#index'

  resources :users, only: [:index]

  get 'search_quotes_path' => 'quotes#search', as: :search_quotes

end
