BestBeer::Application.routes.draw do

   root 'beers#index'

   post '/:id' => 'beers#vote', as: "vote"
end
