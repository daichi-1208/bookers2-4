Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  root 'home#top'
  get 'home/about' => "home#about"

  devise_for :users

  resources :books
  resources :users,only: [:show,:index,:edit,:update] do
  	resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end

end
