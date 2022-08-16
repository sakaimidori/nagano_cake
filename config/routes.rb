Rails.application.routes.draw do

#会員側のルーティング設定
  root to: "public/homes#top"
  get 'about' => 'public/homes#about',as: 'about'

  #public/customers
  get 'customers' => 'public/customers#show'
  patch 'customers' => 'public/customers#update'
  get 'customers/edit' => 'public/customers#edit'
  get 'customers/confirm' => 'public/customers#confirm'
  patch 'customers/withdraw' => 'public/customers#withdraw'

  #public/addresses
 get 'addresses' => 'public/addresses#index'
 post 'addresses' => 'public/addresses#create'
 get 'addresses/:id/edit' => 'public/addresses#edit', as: 'edit_addresses'
 patch 'addresses/:id' => 'public/addresses#update', as: 'address'
 delete 'addresses/:id' => 'public/addresses#destroy'

 #public/items
 get 'items' => 'public/items#index'
 get 'items/:id' => 'public/items#show', as: 'item'

 #public/cart_items
 get 'cart_items' => 'public/cart_items#index'
 patch 'cart_items/:id' => 'public/cart_items#update'
 delete 'cart_items/all_destroy' => 'public/cart_items#all_destroy'
 delete 'cart_items/:id' => 'public/cart_items#destroy', as: 'cart_items_destroy'
 post 'cart_items' => 'public/cart_items#create'

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }




 # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #管理者側のルーティング設定
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit,:update]
    resources :customers, only: [:index, :show, :edit, :update]
  end






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
