BestBeer::Application.routes.draw do

   root 'beers#index'

   post '/:id' => 'beers#vote', as: "vote"
   post 'beers/search' => 'beers#search', as: "search_beer"
end
