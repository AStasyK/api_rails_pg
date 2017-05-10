Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs, only: [:index]
      end
      post 'companies/mark_destroy/:id', to: 'companies#mark_destroy'
    end
  end

  #match '*path', to: 'application#catch_404', via: :all

end
