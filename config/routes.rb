Rails.application.routes.draw do
  resources :reports, only: :show

  namespace :admin do
    resources :log_entries do
      get :duplicate
    end
    resources :applications do
      resources :log_entries
    end
    root to: 'applications#index'
  end
end
