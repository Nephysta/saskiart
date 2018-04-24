Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pictures, only: [:index, :create]
      get 'themes' => 'themes#show', via: :get
    end
  end
end
