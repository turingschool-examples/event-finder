require "rails_helper"

describe "When a user searchs for an event" do
  it "they can find an event by zip code" do
    VCR.use_cassette("eventful_find_by_zip") do
      visit root_path

      fill_in :q, :with => "80202"

      click_on "Find Events"

      expect(current_path).to eq '/search'
      expect(page).to have_content "16 events for March"
      expect(page).to have_selector('.event', count: 16)
      expect(page).to have_content "Experience Hendrix"
      expect(page).to have_content "2017-03-07 19:30:00"
      expect(page).to have_link "Paramount Theatre"
      expect(page).to have_content "1621 Glenarm Place"
      expect(page).to have_content "Mile High Wine Tours is the best way to enjoy Denver"
    end
  end
end

