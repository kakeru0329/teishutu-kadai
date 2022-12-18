Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    passwords: 'public/passwords',
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  devise_scope :customer do
   post 'customers/guest_sign_in', to: 'public/sessions#new_guest'
  end

  namespace :admin do

    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :update, :destroy]
      resources :comments, only: [:destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/posts/search' => 'posts#search'
    resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
    resources :customers ,only:[:edit, :update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end