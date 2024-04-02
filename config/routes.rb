Rails.application.routes.draw do
  get '/csrf-token', to: 'csrf_tokens#index'
  root "articles#index"

  resources :articles do
    resources :comments
    collection do
      get "get_archived"
    end
  end

  post '/user/register', to: 'authentication#register'
  post '/user/login', to: 'authentication#login'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
