require 'rails_helper'

RSpec.describe "search for events" do
  context "user can visit root path and see event search finder" do
    it "can visit root path" do
      visit root_path

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Greetings, Earthlings")
      expect(page).to have_content("EventFinder")
    end
  end

  context "user can input data into evenfinder and search for events" do
    it "can seach for events by zip" do
      visit root_path
      fill_in :q, with: "80202"
      click_on "Find Events"

      expect(current_path).to eq('/search')
    end

  # And I can see a list of 16 events with a header `16 events for March', sorted by popularity. 
  # For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
  end
end