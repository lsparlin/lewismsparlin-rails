Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/show'
  get 'blog/show'
  resources :blog, only: [:show]
  resources :tags, only: [:index, :show]

  resolve('Blog') { [:blog] }

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
