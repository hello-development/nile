Rails.application.routes.draw do
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root 'items#index'

  get 'carts/register'
  get 'carts/add_item'
  get 'carts/update_item'
  get 'carts/delete_item'
  get 'carts/confirmation'
  get 'artists/admin_index'
  get 'items/admin_index'
  
  resources :users, only: [:show, :edit, :update, :index]do
    resources :addresses, only: [:new, :create, :edit, :show, :update, :destroy]
    resource :carts, only: [:show]
  end

  resources :artists

  resources :items do
    resource :likes, only: [:create, :destroy]
    resource :reviews, only: [:create, :destroy]
    resources :disks, only: [:new, :create, :index, :destroy]do
      resources :songs, only: [:new, :create, :edit, :update, :index, :destroy]
    end
  end

  resources :purchases, only: [:create, :update]do
    resource :purchase_datails, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
