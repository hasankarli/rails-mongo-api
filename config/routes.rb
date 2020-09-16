Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post 'login', action: :login, controller: :auth
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :v1 do
      get 'get_users', action: :get_users, controller: :users
      get 'show_user', action: :show_user, controller: :users
      post 'add_user', action: :add_user, controller: :users
      put 'update_user', action: :update_user, controller: :users
      delete 'delete_user', action: :delete_user, controller: :users
    end
  end
end
