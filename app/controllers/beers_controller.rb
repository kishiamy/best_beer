class BeersController < ApplicationController

  def index
    if data_present?
      @beers = brewery_db.search.beers(q: params[:name])
      render :search
    else
      @beers = Beer.order(votes: :desc).limit(10)
    end
  end

  def vote
    @beer = Beer.where(obdb_id: params[:obdb_id]).first
    @beer.add_vote 
    redirect_to root_path
  end

  def create
    if data_present?
      @beer = Beer.create(name: params[:name])
      redirect_to index_path
    else
      render :new
    end
  end

  def new
    @beer = Beer.new(name: params[:name])
    redirect_to index_path
  end

  private

  def data_present?
    params[:name].present?
  end
end
