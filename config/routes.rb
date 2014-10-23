Rails.application.routes.draw do
  resources :reports, only: :show

  namespace :admin do
    resources :log_entries
    root to: 'log_entries#index'
  end
end
