Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about' , as: 'about'

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:mypage, :show, :edit, :update]
  #resources :posts, only: [:new, :index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
