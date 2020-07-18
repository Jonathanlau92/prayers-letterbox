Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :prayers

    root to: "prayers#index"
  end
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    get 'add_friends', to: 'users#add_friends', as: :add_friends
    get 'accept_request', to: 'users#accept_request', as: :accept_request
    get 'block_request', to: 'users#block_request', as: :block_request
  end
  get '/friend-list', to: 'users#index', as: :friend_list

  resources :prayers, except: :show
  resources :authentications, only: [:destroy]
  resources :comments
  get '/prayer-request', to: 'prayers#prayer_request', as: :prayer_request
  post 'send_prayer_email', to: 'prayers#send_prayer_email', as: :send_prayer_email
  post 'report-spam', to: 'prayers#report_spam', as: :report_spam

  get 'about-us', to: 'pages#about_us', as: :about_us
  get 'privacy-policy', to: 'pages#privacy_policy', as: :privacy_policy


  root to: 'prayers#index'
end
