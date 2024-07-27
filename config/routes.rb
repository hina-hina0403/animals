Rails.application.routes.draw do
  
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  devise_for :users
  root to: "homes#top"

  get 'homes/about' => 'homes#about' , as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
