require "rails_helper"

RSpec.describe do
  context "visitor" do
    it "views events for a given zipcode" do
      VCR.use_cassette("events") do
        Net::HTTP.get_response(URI("http://api.eventful.com/json/events/search?&location=80202&sort_order=popularity&app_key=#{ENV["EVENTFUL_API_KEY"]}&date=march&sort_direction=descending&page_size=16&include=popularity"))
        visit root_path

        fill_in :q, with: 80202
        click_on "Find Events"
        expect(current_path).to eq search_path
        expect(page).to have_content "16 Events for March"
        expect(page).to have_selector(".event", count: 16)
        within first(".event") do
          expect(page).to have_content "Event: Experience Hendrix"
          expect(page).to have_content "Date: March 7th, 2017"
          expect(page).to have_content "Time: 19:30"
          expect(page).to have_content "Description: ..."
          expect(page).to have_link "Paramount Theatre", href: "http://denver.eventful.com/venues/paramount-theatre-/V0-001-000198697-3?utm_source=apis&utm_medium=apim&utm_campaign=apic"
          expect(page).to have_content "Venue Address: 1621 Glenarm Place"
        end
      end
    end
  end
end
