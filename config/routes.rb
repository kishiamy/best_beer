BestBeer::Application.routes.draw do

   root to: 'beers#index'

   post '/:obdb_id' => 'beers#vote', as: "vote"
   get '/beers/search/:name' => 'beers#search', as: "search_beer"
end
