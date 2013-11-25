require 'spec_helper'

describe "Voting" do
  before do
    beer = FactoryGirl.create(:beer)
    visit root_path
  end

  context "when 0 votes" do
    it "should increase the vote in 1" do
      click_link('Vote!')
      expect(page).to have_content 'Votes: 1'
    end
  end

  context "when 1 vote" do
    it "should increase the vote in 2" do
      click_link('Vote!')
      click_link('Votes: 1')
      expect(page).to have_content 'Votes: 2'
    end
  end
end
