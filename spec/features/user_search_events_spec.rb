require 'rails_helper'

describe 'User search' do
  it 'with zipcode' do
    VCR.use_cassette 'search' do
      visit root_path
      fill_in :q, with: "80202"
      click_on "Find Events"

      expect(current_path).to eq('/search')
      expect(page).to have_content("16 events for March")
    end
  end
end
