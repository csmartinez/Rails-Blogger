Rails.application.routes.draw do
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
  root :to => 'posts#index'
  resources :users
    resources :posts
      resources :comments, :except => [:show, :index]
end
