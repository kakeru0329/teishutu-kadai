Rails.application.routes.draw do

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: 'homes#top'
    resources :posts, only: [:index, :show, :new, :create, :destroy]
    resources :genres, only: [:index, :edit, :create, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch '/customers/withdraw' => 'customerswithdraw', as: 'customer_withdraw'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end