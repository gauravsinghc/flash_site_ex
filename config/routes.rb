Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "deals#welcome"
  resources :users
  resources :deals
  resources :orders do
    post :submit, on: :collection
  end
end
