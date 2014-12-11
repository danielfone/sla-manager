Rails.application.routes.draw do
  resources :reports, only: :show

  namespace :admin do
    resources :log_entries do
      get :duplicate
    end
    resources :repositories do
      resources :log_entries
    end
    root to: 'repositories#index'
  end
end
