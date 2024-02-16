Rails.application.routes.draw do
  get "/search?query=thriller", to: "songs#search"
  get "/songs/named/:name", to: "songs#search"

  # resources :songs
  # # verb '/path', to: 'controller#action', as: :prefix
  # get '/songs', to: 'songs#index', as: :songs
  # get '/songs/:id', to: 'songs#show', as: :song
  # get '/songs/new', to: 'songs#new', as: :new_song
  # post '/songs', to: 'songs#create'
  # get '/songs/:id/edit', to: 'songs#edit', as: :edit_song
  # patch '/songs/:id', to: 'songs#update'
  # delete '/songs/:id', to: 'songs#destroy'

  resources :songs do
    resouces :review, only: [:new, :create]
  end
end

# params[:query]
# params[:name]
