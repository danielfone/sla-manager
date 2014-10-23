Rails.application.routes.draw do
  resources :reports, only: :show
end
