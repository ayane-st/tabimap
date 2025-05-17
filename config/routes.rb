Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end

  devise_for :users

  root to: "homes#top"
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users
  get 'homes/top'
  get 'homes/about'
  get '/search', to: 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
