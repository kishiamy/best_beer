require 'spec_helper'

describe BeersController do

  describe "POST vote" do
    let(:beer) { FactoryGirl.create(:beer) }

    it "increase vote count" do
      expect(Beer).to receive(:find).with("1").and_return(beer)
      post :vote, obdb_id: beer.obdb_id
      expect(beer.votes).to eql(1)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET search" do
    it "search beer by name" do
      VCR.use_cassette('corona') do
        get :search, name: 'Corona', format: 'json'
        expect(response.body.size).to eq(3505)
        expect(response.status).to eq(200)
      end
    end
  end
end
