class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def brewery_db
    @brewery_db ||= BreweryDB::Client.new do |config| 
      config.api_key = BestBeer::Application.config.api_key 
    end
  end
end
