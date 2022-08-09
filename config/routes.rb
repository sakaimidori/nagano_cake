Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

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
