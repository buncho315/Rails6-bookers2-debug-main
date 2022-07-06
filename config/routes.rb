Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  patch 'users/:id' => 'users#update', as: 'update_user'
  devise_for :users
  resources :users, only: [:show, :index, :edit] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end