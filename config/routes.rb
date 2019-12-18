Rails.application.routes.draw do
  resources :the_logz, only: [:index] 
  resources :populations, only: [:index] 
  get 'populations/by_year', to: 'populations#show'
  root to: "populations#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
