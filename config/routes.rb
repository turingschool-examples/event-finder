Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: "search#index"
  get '/auth/eventful', as: :eventful_login
  get '/auth/eventful/callback', to: "sessions#create"
end
