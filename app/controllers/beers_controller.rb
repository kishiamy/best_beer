class BeersController < ApplicationController
  
  def vote 
    @beer = Beer.find(params[:id])
    @beer.vote 
    redirect_to root_path
  end
end
