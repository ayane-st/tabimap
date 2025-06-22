Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
   sessions: 'admin/sessions'
  }

  #devise_for :admins, path: "admin", controllers: {
  #  sessions: 'admin/admins/sessions'
  #}
  
  #$ rails g devise:controllers admin/admins
  #$ rails g devise:views admin/admins

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  devise_for :users, path: "/", controllers: {
    registrations: 'public/users/registrations',
    sessions: 'public/users/sessions'
  }

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    root to: "homes#top"
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get '/about', to: 'homes#about'
    get '/search', to: 'searches#search'
  end

  get '/favicon.ico', to: -> (_) { [204, { 'Content-Type' => 'image/x-icon' }, ['']] }
  get '/.well-known/security.txt', to: -> (_) { [200, { 'Content-Type' => 'text/plain' }, ['YOUR SECURITY INFORMATION HERE']] }

end
