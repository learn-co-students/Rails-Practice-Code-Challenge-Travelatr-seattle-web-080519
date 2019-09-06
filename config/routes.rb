Rails.application.routes.draw do
  resources :application
  resources :bloggers
  resources :destinations
  resources :posts
  get '/posts/:id/likes', to: 'posts#likes', as: 'button'
end
