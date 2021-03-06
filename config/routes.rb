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
  get 'carts/delete_all'
  post 'carts/:item_id/add_item' => 'carts#add_item', as: :carts_add_item #item_idをurlに含めて送信
  patch 'carts/:item_id/update_item' => 'carts#update_item', as: :carts_update_item
  delete 'carts/:item_id/delete_item' => 'carts#delete_item', as: :carts_delete_item
  # get 'carts/confirmation'
  get 'artists/admin_index'
  # get 'items/admin_index'
  patch 'users/:id/favorite' => 'users#favorite', as: :user_favorite
  # get 'purchase/:purchase_id/confirmation' => 'purchase_datails#confirmation', as: :confirmation

  resources :users, only: [:show, :edit, :update, :index, :destroy]do
    resources :addresses, only: [:new, :create, :edit, :show, :update, :destroy]
    resource :carts, only: [:show]
  end

  delete '/users/:id' => 'users#destroy'

  resources :artists

  resources :items do
    resource :likes, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
    resources :disks, only: [:new, :create, :index, :destroy]do
      resources :songs, only: [:new, :create, :edit, :update, :index, :destroy]
    end
  end

  resources :purchases, only: [:create, :update, :index]do
    resource :purchase_datails, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
