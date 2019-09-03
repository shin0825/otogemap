Rails.application.routes.draw do
  root to: "amusement_arcades#index"

  devise_for :users, :controllers => {
    :sessions => "users/sessions"
  }

  devise_scope :user do
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :iidxes
  get "iidxes/new/:amusement_arcade_id" => "iidxes#new", :as => "new_iidx_with_ac"
  get "iidxes/machine_tag/:name", to: "iidxes#iidxes_machine_tag", :as => "iidxes_machine_tag"
  resources :amusement_arcades

  get "shop_tag/:name", to: "amusement_arcades#shop_tag", :as => "shop_tag"
  get "search/amusement_arcades/result", to: "searches#amusement_arcades_result", :as => "amusement_arcades_result"
  get "search/iidxes/result", to: "searches#iidxes_result", :as => "iidxes_result"

end
