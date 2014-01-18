require 'spec_helper'

describe BeersController do

  describe "POST vote" do
    let(:beer) { FactoryGirl.create(:beer) }

    it "increase vote count" do
      expect(Beer).to receive(:find).with("1").and_return(beer)
      post :vote, obdb_id: 1
      expect(beer.votes).to eql(1)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST search" do
    stub_request(:get, "http://api.brewerydb.com/v2/?key=API_KEY&q=Corona").
      with(:body => "{\"id\":\"u7U2Ga\",\"name\":\"Corona Light\",\"glassware_id\":5,\"available_id\":1,\"style_id\":94,\"is_organic\":\"N\",\"labels\":{\"icon\":\"https://s3.amazonaws.com/brewerydbapi/beer/u7U2Ga/upload_eQUVvN-icon.png\",\"medium\":\"https://s3.amazonaws.com/brewerydbapi/beer/u7U2Ga/upload_eQUVvN-medium.png\",\"large\":\"https://s3.amazonaws.com/brewerydbapi/beer/u7U2Ga/upload_eQUVvN-large.png\"},\"status\":\"verified\",\"status_display\":\"Verified\",\"create_date\":\"2012-01-03 02:43:01\",\"update_date\":\"2013-02-01 11:37:48\",\"glass\":{\"id\":5,\"name\":\"Pint\",\"create_date\":\"2012-01-03 02:41:33\"},\"available\":{\"id\":1,\"name\":\"Year Round\",\"description\":\"Available year round as a staple beer.\"},\"style\":{\"id\":94,\"category_id\":8,\"category\":{\"id\":8,\"name\":\"North American Lager\",\"create_date\":\"2012-03-21 20:06:46\"},\"name\":\"American-Style Light (Low Calorie) Lager\",\"description\":\"These beers are extremely light colored, light in body, and high in carbonation. Calorie level should not exceed 125 per 12 ounce serving. Corn, rice, or other grain or sugar adjuncts are often used. Flavor is mild and hop bitterness and aroma is negligible to very low. Light fruity esters are acceptable. Chill haze and diacetyl should be absent.\",\"ibu_min\":\"5\",\"ibu_max\":\"10\",\"abv_min\":\"3.5\",\"abv_max\":\"4.4\",\"srm_min\":\"2\",\"srm_max\":\"4\",\"og_min\":\"1.024\",\"fg_min\":\"1.002\",\"fg_max\":\"1.008\",\"create_date\":\"2012-03-21 20:06:46\"},\"type\":\"beer\"}", :headers => {'Content-Type' => 'application/json'})

    it "search beer by name" do
      post :search, name: 'Corona'
      expect()
    end
  end
end
