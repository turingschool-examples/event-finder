require 'rails_helper'

describe "As a user" do
  context "when I fill in my zipcode and click on 'Find Events'" do
    before do
      @events = JSON.parse(Faraday.get("http://api.eventful.com/json/events/search?location=80202&date=March&page_size=16&sort_order=popularity&app_key=#{ENV["eventful_app_key"]}").body)["events"]["event"]
    end
    it "I should see a list of events" do
      visit root_path

      fill_in :q, :with => '80202'
      click_on('Find Events')

      expect(current_path).to eq('/search')
      expect(page).to have_content('16 Events for March')
      expect(page).to have_css("h2", :count => 16)
      @events.each do |event|
        expect(page).to have_content(event["title"])
        expect(page).to have_content(event["start_time"])
        expect(page).to have_content(event["description"])
        expect(page).to have_content(event["venue_name"])
        expect(page).to have_content(event["venue_address"])
        expect(page).to have_content(event["going"])
      end
      # expect(@events.first["going"]).to be > @events.last["going"]
      # ^
      # Dear reviewer of this code,
      #    How would I go about testing that these are in order of popularity?
      # Sincerely,
      #   Lucy
    end

  end
end
