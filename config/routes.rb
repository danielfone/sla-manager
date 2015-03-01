Rails.application.routes.draw do
  resources :reports, only: :show
  resources :clients, only: :show

  namespace :admin do
    resources :reports
    resources :log_entries do
      get :duplicate
      collection do
        get :current, action: :index, scope: :current
        get :archived, action: :index, scope: :archived
      end
    end
    resources :repositories do
      resources :log_entries do
        collection do
          get :current, action: :index, scope: :current
          get :archived, action: :index, scope: :archived
        end

      end
    end
    root to: 'repositories#index'
  end
end
