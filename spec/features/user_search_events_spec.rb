require 'rails_helper'

describe 'User search' do
  it 'with zipcode' do
    VCR.use_cassette 'search' do
      visit root_path
      fill_in :q, with: "80202"
      click_on "Find Events"

      expect(current_path).to eq('/search')
      expect(page).to have_content("16 events for March")
      expect(page).to have_css('.event', count: 16)
      within('.event').first do
        expect(page).to have_content("NAME")
        expect(page).to have_content("DATE")
        expect(page).to have_content("DESCRPTION")
        expect(page).to have_link("VENUE NAME")
      end
    end
  end
end
