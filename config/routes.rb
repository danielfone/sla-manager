Rails.application.routes.draw do
  resources :reports, only: :show

  namespace :admin do
    resources :log_entries
    resources :applications do
      resources :log_entries
    end
    root to: 'log_entries#index'
  end
end
