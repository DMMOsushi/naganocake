Rails.application.routes.draw do
#public
  devise_for :public,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
<<<<<<< HEAD
 #変更
=======
  #test
>>>>>>> 3dda18a57698f53101c4ad5a201f6ce9bed63f83
  root 'public/homes#top'
  
  namespace :public do
    get 'public/homes/about',to: "homes#about"

    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe'
    get 'customers/withdraw'

    resources :addresses, only: [:index, :edit, :update, :create, :destroy]

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :destroy, :create]
    put :cart_items, to: 'cart_items#destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm'
    get 'orders/thanks'

  end

#admin
  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, only: [:new, :create, :index, :show, :edit, :update]

    resources :categories, only: [:create, :index, :edit, :update]

    resources :orders, only: [:show, :update]

    resources :order_items, only: [:update]
     

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
