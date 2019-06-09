Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/top_posts', to: 'search_post#top_posts'
      get '/uniq_ip_posters', to: 'search_post#uniq_ip_posters'

      resources :post, only: [:create] do
        resource :rating, only: [:create]
      end
    end
  end
end
