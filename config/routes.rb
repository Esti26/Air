Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :wigs do
    resources :wig_rentals, only: %i[new create]
  end
  get "/mywigs", to: "wigs#mywigs", as: "mywigs"
  get "/myrentals", to: "wig_rentals#myrentals", as: "myrentals"

end
