Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'authentication#login'
      resources :authors
      resources :books
      resources :users, except: [:index]
      resources :loans do
        member do
          patch :return_book
        end
      end
    end
  end
end
