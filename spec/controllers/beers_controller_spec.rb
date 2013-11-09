require 'spec_helper'

describe BeersController do

  describe "#vote" do
    let(:beer) { double "Bita beer" }
    it "increase vote count" do
      expect(Beer).to receive(:find).with("1").and_return(beer)
      expect(beer).to receive(:vote) 
      post :vote, id: 1
      expect(response).to redirect_to(root_path)
    end
  end


end
