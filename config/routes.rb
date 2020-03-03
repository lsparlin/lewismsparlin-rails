Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/show'
  get 'blog/show'
  resources :blog, only: [:show]
  resources :tags, only: [:show]

  resolve('Blog') { [:blog] }

  root 'home#index'

  get '/404', to: 'errors#not_found'
end
