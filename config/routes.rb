Rails.application.routes.draw do
  devise_for :users, :path=>'',
                    :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                    :controllers=>{:registrations=>'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :users, only: [:show]
  resources :clubs do
    resources :reservations, only: [:create]
  end
  resources :photos

  get '/preload' => 'reservations#preload'
  get 'your_inscriptions' => 'reservations#your_inscriptions'
end
