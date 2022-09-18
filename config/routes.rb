Rails.application.routes.draw do
  devise_for :users

  root to: "groups#index"
  
  get '/groups/member', to: 'groups#member', as: 'groups_member'
  get '/groups/created', to: 'groups#created_by_me', as: 'groups_created'

  resources :groups do
    resources :posts do
      resources :comments do
        resources :comments, only: [:create, :update, :destroy]
      end
    end
    resources :group_memberships, only: [:create, :destroy]
  end

  # match '*unmatched', to: 'application#route_not_found', via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
