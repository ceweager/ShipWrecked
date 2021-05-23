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
    resources :postthreads, only: [:index, :update]
    resources :friendship_invites, only: [:new, :create, :edit, :update]
  end

  resources :characters, only: [:index, :destroy] do
    resources :relationships, only: [:new, :create, :edit, :update]
    resources :goals, only: [:new, :create, :edit, :update]
    resources :milestones, only: [:new, :create, :edit, :update]
    resources :postthreads, only: [:new, :create, :edit, :update]
  end
  
  resources :friendship_invites, only: [:destroy]
  resources :relationships, only: [:destroy]
  resources :goals, only: [:destroy]
  resources :milestones, only: [:destroy]
  resources :postthreads, only: [:destroy] do
    resources :connects, only: [:new, :create, :edit, :update]
  end
end
