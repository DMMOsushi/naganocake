Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/create'
    get 'cart_items/destroy_all'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'items/index'
    get 'items/update'
    get 'items/destroy'
    get 'items/create'
    get 'items/destroy_all'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/update'
    get 'addresses/create'
    get 'addresses/destroy'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'orders_items/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'categories/create'
    get 'categories/index'
    get 'categories/edit'
    get 'categories/update'
  end
  namespace :admin do
    get 'items/new'
    get 'items/create'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  devise_for :public,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
