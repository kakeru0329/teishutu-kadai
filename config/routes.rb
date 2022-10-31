Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_scope :customer do
   post 'customers/guest_sign_in', to: 'public/sessions#new_guest'
  end



  scope module: :public do
    root to: 'homes#top'
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
    get 'posts/search'
      resources :comments, only: [:create, :destroy]
    end
    resources :customers ,only:[:show, :edit]
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch '/customers/withdraw' => 'customerswithdraw', as: 'customer_withdraw'
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end




  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end