Rails.application.routes.draw do
  get 'sprints/index'

  get 'sprints/show'

  get 'sprints/new'

  get 'sprints/edit'

  devise_for :users
  resources :teams
  resources :user_profile
  resources :sprints

  post 'team_users/edit_multiple'
  put 'team_users/update_multiple'


  get 'home/index'
  root 'home#index'
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
