Rails.application.routes.draw do
  resources :blog, only: [:show]
  resources :tags, only: [:show]

  resolve('Blog') { [:blog] }

  root 'home#index'

  get '/404', to: 'errors#not_found'
end
