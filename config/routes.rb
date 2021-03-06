Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :favorites, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
    collection do
      get 'user/unsubscribe' => 'users#unsubscribe'
      patch 'user/withdraw' => 'users#withdraw'
    end
  end

  resources :relationships, only: [:create, :destroy]
end
