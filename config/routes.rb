Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/top_posts', to: 'search_post#top_posts'
      resources :post, only: [:create] do
        resource :rating, only: [:create]
      end
    end
  end
end
