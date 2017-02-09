require 'rails_helper'

describe "User" do
  it "can search for events by zipcode" do
    # As a user, 
    visit root_path

    within(".search-field") do
      # When I fill in the search with 80202, 
      fill_in "q", with: "80202"
      # And I click Find Events, 
      click_on "Find Events"
    end
    # The current path is `/search`,
    expect(current_path).to eq('/search')

  end
end
# And I can see a list of 16 events with a header `16 events for March', sorted by popularity. 
# For each event I can see the Event name, 
# date & time, 
# description (shortened to 140 characters), 
# venue name (url to the venue page), 
# venue address.