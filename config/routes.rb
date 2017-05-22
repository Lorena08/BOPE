Rails.application.routes.draw do

  devise_for :users
  resources :teams
  resources :user_profile
  resources :projects
  resources :sprints
  resources :activities
  resources :colors, except: [:show]
  resources :labels, except: [:show]
  resources :statuses, except: [:show]


  post 'team_users/edit_multiple'
  put 'team_users/update_multiple'


  get 'home/index'
  root 'home#index'
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
