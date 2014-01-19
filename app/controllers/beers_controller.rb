class BeersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:search]

  def search
    brewery_db = BreweryDB::Client.new do |config|
        config.api_key = (ENV['BREWERY_KEY'])
    end

    @beers = brewery_db.search.beers(q: params[:name])
    respond_to do |format|
      format.json { render json: @beers }
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
