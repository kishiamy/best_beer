require 'spec_helper'

describe BeersController do

  describe " POST vote" do
    let(:beer) { FactoryGirl.create(:beer) }
    it "increase vote count" do
      expect(Beer).to receive(:find).with("1").and_return(beer)
      expect(Beer.any_instance).to receive(:vote) 
      post :vote, obdb_id: 1
      expect(response).to redirect_to(root_path)
    end
  end


end
