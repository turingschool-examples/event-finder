require 'rails_helper'

# As a user,
# When I fill in the search with 80202,
# And I click Find Events,
# The current path is `/search`,
# And I can see a list of 16 events with a header `16 events for March', sorted by popularity.
# For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.

RSpec.describe "Event Finder API", :type => :request do

  it "returns events by zip code" do
    visit '/'

    fill_in "q",  with: "80202"
    click_link("Find Events")
    expect(current_path).to eq('/search')



  end
end
