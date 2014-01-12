require 'spec_helper'

describe BeersController do

  describe "POST vote" do
    let(:beer) { FactoryGirl.create(:beer) }

    it "increase vote count" do
      expect(Beer).to receive(:find).with("1").and_return(beer)
      post :vote, id: 1
      expect(beer.votes).to eql(1)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
