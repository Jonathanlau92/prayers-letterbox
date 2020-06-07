Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :prayers

    root to: "prayers#index"
  end
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: "users/registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    get 'add_friends', to: 'users#add_friends', as: :add_friends
  end
  resources :prayers, except: :show
  resources :comments

  get '/friends-list', to: 'users#index', as: :friend_list
  get '/prayer-request', to: 'prayers#prayer_request', as: :prayer_request
  post 'send_prayer_email', to: 'prayers#send_prayer_email', as: :send_prayer_email
  post 'report-spam', to: 'prayers#report_spam', as: :report_spam

  get 'about-us', to: 'pages#about_us', as: :about_us

  root to: 'prayers#index'
end
