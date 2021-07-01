Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users do
    resources :characters, except: [:destroy] do
      member do
        get :edit_overview
        get :edit_personality
        get :edit_history
        get :edit_other
      end
    end
    resources :postthreads, only: %i[index update]
    resources :friendship_invites, only: %i[new create edit update]
    resources :chatrooms, only: %i[index show new create]
  end

  resources :chatrooms do
    resources :messages, only: :create
  end

  resources :characters, only: %i[index destroy] do
    resources :relationships, only: %i[new create edit update]
    resources :goals, only: %i[new create edit update]
    resources :milestones, only: %i[new create edit update]
    resources :postthreads, only: %i[new create edit update]
  end

  resources :chatrooms, only: [:destroy]
  resources :friendship_invites, only: [:destroy]
  resources :relationships, only: [:destroy]
  resources :goals, only: [:destroy]
  resources :milestones, only: [:destroy]
  resources :postthreads, only: [:destroy] do
    resources :connects, only: %i[new create edit update]
  end
end
