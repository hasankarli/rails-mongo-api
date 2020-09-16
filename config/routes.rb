Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post 'login', action: :login, controller: :auth
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :v1 do
      get 'get_users', action: :getUsers, controller: :users
      get 'show_user', action: :showUser, controller: :users
      post 'add_user', action: :addUser, controller: :users
      put 'update_user', action: :updateUser, controller: :users
      delete 'delete_user', action: :deleteUser, controller: :users
    end
  end
end
