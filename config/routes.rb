Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'account_activations/edit'

  get 'sessions/new'

  get                     'users/new'
  root                    'static_pages#home'
  get     'help',     to: 'static_pages#help'
  get     'about',    to: 'static_pages#about'
  get     'contact',  to: 'static_pages#contact'
  get     'cv',    to:    'static_pages#cv'
  get     'signup',   to: 'users#new'
  post    'signup',   to: 'users#create'
  get     'login',    to: 'sessions#new'
  post    'login',    to: 'sessions#create'
  delete  'logout',   to: 'sessions#destroy'
  resources :users
  resources :account_activations,   only: [:edit]
  resources :password_resets,       only: [:new, :create, :edit, :update]
  resources :microposts,            only: [:create, :destroy]
  resources :contacts,              only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
