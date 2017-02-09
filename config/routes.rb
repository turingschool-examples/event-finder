Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: "search#index"

  post 'http://eventful.com/oauth/request_token', to: "sessions#new"
  get 'http://eventful.com/oauth/authorize', to: "sessions#create"
  post 'http://eventful.com/oauth/access_token', to: "sessions#create"
end
