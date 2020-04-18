Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :prayers
  post 'send_prayer_email', to: 'prayers#send_prayer_email', as: :send_prayer_email

  get 'about-us', to: 'pages#about_us', as: :about_us

  root to: 'prayers#index'
end
