BestBeer::Application.routes.draw do

   root 'beers#index'

   post '/:obdb_id' => 'beers#vote', as: "vote"
end
