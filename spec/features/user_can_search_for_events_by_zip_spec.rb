require "rails_helper"

describe "When a user searchs for an event" do
  it "they can find an event by zip code" do
    VCR.use_cassette("eventful_find_by_zip") do
      visit root_path

      fill_in :q, :with => "80203"

      click_on "Find Events"

      expect(current_path).to eq '/search'
      expect(page).to have_content "16 events for March"
      expect(page).to have_content "Experience Hendrix"
      expect(page).to have_content "2017-03-07 19:30:00"
      expect(page).to have_content "Paramount Theatre"
      expect(page).to have_link "http://denver.eventful.com/venues/paramount-theatre-/V0-001-000198697-3?utm_source=apis&amp;utm_medium=apim&amp;utm_campaign=apic"
      expect(page).to have_content "1621 Glenarm Place"
      expect(page).to have_content "Mile High Wine Tours is the best way to enjoy Denver"
    end
  end
end

