class BeersController < ApplicationController

  def index
    @beers = Beer.order(votes: :desc).limit(10)
  end
  
  def vote
    @beer = Beer.find(params[:obdb_id])
    @beer.add_vote 
    redirect_to root_path
  end
end
