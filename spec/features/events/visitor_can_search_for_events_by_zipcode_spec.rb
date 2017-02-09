=begin
As a user,
When I fill in the search with 80202,
And I click Find Events,
The current path is `/search`,
And I can see a list of 16 events with a header `16 events for March', sorted by popularity.
For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
=end

require "rails_helper"

RSpec.describe do
  context "visitor" do
    it "views events for a given zipcode" do
      VCR.use_cassette("events") do
        Net::HTTP.get_response(URI("http://api.eventful.com/json/events/search?&location=80202&sort_order=popularity&app_key=#{ENV["EVENTFUL_API_KEY"]}&date=march&sort_direction=descending&page_size=16"))
        visit root_path

        fill_in :q, with: 80202
        click_on "Find Events"
        expect(current_path).to eq search_path
        expect(page).to have_content "16 Events for March"
        expect(page).to have_selector(".event", count: 16)
        within first(".event") do
          expect(page).to have_content "Event: Experience Hendrix"
          expect(page).to have_content "Date: 2017-03-07"
          expect(page).to have_content "Time:"
          expect(page).to have_content "Description:"
          expect(page).to have_content "Venue:"
          expect(page).to have_link "venue_name", href: venue_path(venue)
          expect(page).to have_content "Venue Address:"
        end
      end
    end
  end
end
