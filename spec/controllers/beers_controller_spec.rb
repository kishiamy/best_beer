require 'spec_helper'

describe BeersController do

  describe "POST vote" do
    let(:beer) { FactoryGirl.create(:beer) }

    it "increase vote count" do
      post :vote, obdb_id: beer.obdb_id
      expect(beer.reload.votes).to eql(1)
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
