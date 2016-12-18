Rails.application.routes.draw do
  get 'voting/new'

  get 'users/new'

  root 'static_pages#home'

  get 'static_pages/home'

  get 'static_pages/ratings'

  get  '/signup',  to: 'users#new'

  get 'voting/vote_for' => 'voting#vote_for'

  resources :users,          only: [:create, :new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
