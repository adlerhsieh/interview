Rails.application.routes.draw do
  resources :posts, only: %i(index show) do
    resources :comments, only: %i(index show)
  end

  root to: 'posts#index'
end
