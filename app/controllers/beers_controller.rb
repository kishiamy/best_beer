class BeersController < ApplicationController

  def index
    @beers = Beer.order(vote: :asc).limit(10)
  end
  
  def vote 
    @beer = Beer.find(params[:id])
    @beer.vote 
    redirect_to root_path
  end
end
