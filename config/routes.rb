Rails.application.routes.draw do
  devise_for :users
  get 'relationships/create'
  get 'relationships/destroy'
  get "following_posts" => "posts#following_posts"#追記
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'bookmarks/index'
  get 'items/index'
  root "posts#index"
  get '/post/hashtag/:name', to: "posts#hashtag"
  post '/posts/:post_id/favorites' => "favorites#create"
  delete '/posts/:post_id/favorites' => "favorites#destroy"
  
  

  resources :notifications, only: :index
  resources :categories, only: [:index, :new]

  resources :posts do
    member do
      get :following, :followers, :users_posts#追記
    end
    resources :maps
    resource :bookmarks, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create]
    namespace :api do
      resources :comments, only: :index, defaults: { format: 'json' }
    end
    collection do
      get 'search'
    end
  end

  
  resources :users do
    resources :notifications, only: :index
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
    get :bookmarks, on: :member
  end
  

end
