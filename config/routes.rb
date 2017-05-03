Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs, only: [:index]
      end
    end
  end
end
