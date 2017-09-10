Rails.application.routes.draw do
  resources :snaps
  devise_for :users
 root "snaps#index"
 
 get "contact" => "pages#contact"
end
