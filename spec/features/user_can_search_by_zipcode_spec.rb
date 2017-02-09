require 'rails_helper'

RSpec.describe "User can search by zip code" do
  context "returns expected events" do
    it "shows names" do
      visit '/'
      fill_in :q, :with => "80202"
      click_button "Find Events"

      expect(path).to eq('/search')
    end
  end
end


# As a user, 
# When I fill in the search with 80202, 
# And I click Find Events, 
# The current path is `/search`,
# And I can see a list of 16 events with a header `16 events for March', sorted by popularity. 
# For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.