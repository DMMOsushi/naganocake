Rails.application.routes.draw do

  devise_for :publics,skip: [:passwords,], controllers: {
    registrations: "publics/registrations",
    sessions: 'publics/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
