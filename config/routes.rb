Rails.application.routes.draw do
  
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  devise_for :users

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    root to: "homes#top"
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users
    get 'homes/about'
    get '/search', to: 'searches#search'
  end

end
