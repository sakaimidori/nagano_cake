Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #customersルーティング設定
  get 'customers' => 'public/customers#show'
  patch 'customers' => 'public/customers#update'
  get 'customers/edit' => 'public/customers#edit'
  get 'customers/confirm' => 'public/customers#confirm'
  patch 'customers/withdraw' => 'public/customers#withdraw'

  #addressルーティング設定
 get 'addresses' => 'public/addresses#index'
 post 'addresses' => 'public/addresses#create'
 get 'addresses/:id/edit' => 'public/addresses#edit'
 patch 'addresses/:id' => 'public/addresses#update'



  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者側のルーティング設定
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit,:update]
    resources :customers, only: [:index, :show, :edit, :update]
  end


  #会員側のルーティング設定
  root to: "public/homes#top"
  get 'about' => 'public/homes#about',as: 'about'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
