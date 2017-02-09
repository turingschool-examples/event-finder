# As a user, 
#   When I fill in the search with 80202, 
#   And I click Find Events, 
#   The current path is `/search,
#   And I can see a list of 16 events with a header `16 events for March', sorted by popularity. 
#   For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.

require 'rails_helper'

describe "Viewing events" do
  context "given a zipcode" do
    scenario "user sees a list of events in that zipcode", :vcr => true do
      visit root_path
      fill_in "q", with: "80202"
      click_on "Find Events"

      # expect(page).to have_current_path(search_path)
      expect(page).to have_content "16 events for March"
      expect(page).to have_css(".event", count: 16)
      within first(".event") do
        expect(page).to have_content "Lil Wayne  - A Boogie Wit Da Hoodie"
      end
    end
  end

end
