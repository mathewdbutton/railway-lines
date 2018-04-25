Rails.application.routes.draw do
  root to: 'landings#index'

  namespace :api do
    resources :events, only: %i(create update)
    resources :timelines, only: %i(show index)
    post 'authenticate', to: 'authentication#authenticate'
    resources :users, only: %i(create)
  end

end
