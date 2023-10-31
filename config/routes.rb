Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'

  devise_for :users
  # Define the root route for unauthenticated users
  unauthenticated :user do
    root to: 'homes#index', as: :unauthenticated_root
  end
  # Define the root route for authenticated users (e.g., categories#index)
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  resources :categories, only: %i[index new  create destroy] do
    resources :expenses, only: [:index, :new, :create, :destroy]
  end
end
