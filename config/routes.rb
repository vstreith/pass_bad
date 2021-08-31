Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'subscriptions/new'
  get 'subscriptions/create'
  get 'charges/new'
  get 'charges/create'
  devise_for :users, :path=>'',
                    :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                    :controllers=>{:registrations=>'registrations', :confirmations=>'confirmations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :subscriptions, only: %w[new create]
  resources :users, only: [:show]
  resources :clubs do
    resources :reservations, only: [:create]
  end
  resources :photos
  resources :charges, only: %i[new create]
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get '/preload' => 'reservations#preload'
  get 'your_inscriptions' => 'reservations#your_inscriptions'
  get 'your_reservations' => 'reservations#your_reservations'

  get '/search' => 'pages#search'

match "/404" => "errors#error404", via: [:get, :post, :patch, :delete]

end
