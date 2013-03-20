Personal::Application.routes.draw do
  get "home/index"
  resources :main
  resources :email

  get    "/resume"  => "resume#index"

  root :to => 'home#index'

  match "*a", to: 'home#index'

end
