Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :books
      resources :users, except: [:index]
      resources :loans
    end
  end
end
