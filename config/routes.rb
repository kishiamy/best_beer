BestBeer::Application.routes.draw do

   root 'beers#index'

   post '/:obdb_id' => 'beers#vote', as: "vote"
   get 'beers/search' => 'beers#search', as: "search_beer"
end
