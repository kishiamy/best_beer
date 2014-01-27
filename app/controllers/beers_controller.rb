class BeersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:search]
  
  def search
    if @beers = brewery_db.search.beers(q: params[:name])
      #render json: @beers
      render :search
    end
  end

  def index
    @beers = Beer.order(votes: :desc).limit(10)
  end
  
  def vote
    @beer = Beer.where(obdb_id: params[:obdb_id]).first
    @beer.add_vote 
    redirect_to root_path
  end
end
