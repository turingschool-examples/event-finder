require 'rails_helper'

RSpec.describe "User" do
  it 'is able to search for events in march by zipcode' do
      visit root_path

      fill_in :q, with: "80202"

      click_on "Find Events"

      expect(current_path).to eq('/search')
      expect(page).to have_content("16 events for March")
      expect(page).to have_selector('.events')
      within first('.events') do
        expect(page).to have_selector('.event_name')
        expect(page).to have_selector('.time')
        expect(page).to have_selector('.description')
        expect(page).to have_selector('.venue_name')
        expect(page).to have_selector('.venue_address')
      end
  end
end