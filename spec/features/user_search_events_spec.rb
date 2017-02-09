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
        expect(page).to have_content("Lil Wayne")
        expect(page).to have_content("2017-02-24 20:00:00")
        expect(page).to have_content("700 14th Street")
        expect(page).to have_link("Bellco Theatre (formerly Wells Fargo Theatre)")
      end
    end
  end
  
