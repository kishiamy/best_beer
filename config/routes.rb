BestBeer::Application.routes.draw do

   root to: 'beers#index'

   post '/:obdb_id' => 'beers#vote', as: "vote"
   post '/' => 'beers#create', as: "create"
end
