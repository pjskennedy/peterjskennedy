Pjskennedy::Application.routes.draw do
  devise_for :admin, :controllers => { :omniauth_callbacks => "admins/omniauth_callbacks"}, :skip => [:sessions]do

    delete "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_admin_session
    
    get "admin/sign_in" => "admins/omniauth_callbacks#loginpage", :as => :new_admin_session
    get "admin" => "admins/welcome#index"

    get 'notallowed' => 'welcome#notallowed', :as => :new_user_registration
    post 'notallowed' => 'welcome#notallowed', :as => :user_registration
    
    namespace :admins do
      post "/posts/preview" => "posts#preview"
      
      resources :posts do
        resources :photos
      end

      resources :admins
    end
  end

  resources :posts, only: [:index, :show]

  get "/" => "welcome#index", :as => :home
  get "/about" => "welcome#about", :as => :about

end
