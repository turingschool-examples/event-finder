Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: "search#index"

  get '/auth/:eventful/callback', to: 'sessions#create'
end
