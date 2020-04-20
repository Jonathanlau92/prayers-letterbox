Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :prayers

      root to: "prayers#index"
    end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :prayers
  post 'send_prayer_email', to: 'prayers#send_prayer_email', as: :send_prayer_email
  post 'report-spam', to: 'prayers#report_spam', as: :report_spam

  get 'about-us', to: 'pages#about_us', as: :about_us

  root to: 'prayers#index'
end
