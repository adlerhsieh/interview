Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: %i(index show)
  end

  root to: 'posts#index'
end
