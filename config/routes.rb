Rails.application.routes.draw do
#public
  devise_for :public,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

 #変更
  #test
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'top' => 'admin/homes#top'


  namespace :public do

    resources :customers, only: [:show, :edit, :update]
<<<<<<< HEAD
    get 'customers/unsubscribe/:id' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/:id/withdraw/' => 'customers#withdraw', as: 'withdraw_user'
    put 'withdraw/:id' => 'customers#withdraw'
=======
    get 'customers/unsubscribe/:email' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch ':id/withdraw/:email' => 'customers#withdraw', as: 'withdraw_user'
    put 'withdraw/:email' => 'customers#withdraw'

>>>>>>> c51b8d9e4c04a7c4112def98897c10046662c564

    resources :addresses, only: [:index, :edit, :update, :create, :destroy]

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :destroy, :create]
    put :cart_items, to: 'cart_items#destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm'
    get 'orders/thanks'

  end

#admin

  namespace :admin do

    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, only: [:new, :create, :index, :show, :edit, :update]

    resources :categories, only: [:create, :index, :edit, :update]

    resources :orders, only: [:show, :update]

    resources :order_items, only: [:update]


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
