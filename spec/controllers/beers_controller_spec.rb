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

  describe "GET index" do
    it "search beer by name" do
      VCR.use_cassette('corona') do
        get :index, name: 'Corona'
        expect(response).to render_template("search")
        expect(response).to be_success
      end
    end
  end

=begin
  describe "POST create" do
    let(:beer) { FactoryGirl.create(:beer) }

    it "creates a beer" do
      post :create, name: beer.name
#      expect(beer.count).to eql(1)
      expect(response).to be_success
    end
  end
=end
end
