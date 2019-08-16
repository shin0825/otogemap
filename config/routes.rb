Rails.application.routes.draw do
  root to: 'amusement_arcades#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#show"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :iidxes
  get "iidxes/new/:amusement_arcade_id" => "iidxes#new", :as => "new_iidx_with_ac"
  resources :amusement_arcades
end
