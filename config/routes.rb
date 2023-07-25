Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :spendings
  resources :departments
 get '/download_pdf', to: 'pdf#generate_pdf'
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  root "layouts#header"
end
