Rails.application.routes.draw do
  root to: 'landings#index'

  namespace 'api' do
    resources :events, only: %i(create update)
  end

end
