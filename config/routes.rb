Rails.application.routes.draw do
  resources :consultation_requests, only: [:create, :index] do
    resources :recommendations, only: [:create]
  end

  resources :patients, only: [:create, :index] do
    resources :recommendations, only: [:index]
  end

  get '/consultation_requests/analyze', to: 'consultation_requests#data_analyze'
end
