Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#dashboard"
  
  get "dashboard", to: "static_pages#dashboard"
  get "refresh_billboard", to: 'static_pages#refresh_billboard'
  
  resources :billboards do
    get :activate, on: :member
    get :deactivate, on: :member
  end

  namespace :admin do
    resources :categories
  end

  namespace :api do
    namespace :v1 do
      resources :billboards, only: [:index, :update]
    end
  end
end
