Rails.application.routes.draw do
#public
  devise_for :public,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
 #変更
  #test
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'top' => 'admin/homes#top'

  def after_sign_in_path_for(resource)
    admin_path(resource)
  end

  def after_sign_up_path_for(resource)
    admin_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  namespace :public do

    resources :customers, only: [:show, :edit, :update]
    get 'unsubscribe/:name' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch ':id/withdraw/:name' => 'customers#withdraw', as: 'withdraw_user'
    put 'withdraw/:name' => 'customers#withdraw'

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

    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, only: [:new, :create, :index, :show, :edit, :update]

    resources :categories, only: [:create, :index, :edit, :update]

    resources :orders, only: [:show, :update]

    resources :order_items, only: [:update]


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
