Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/new_releases', to: 'spotify#new_releases'
      get '/albums_by_artist', to: 'search#albums_by_artist'
    end
  end
end
