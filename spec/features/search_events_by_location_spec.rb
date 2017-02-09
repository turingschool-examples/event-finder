require 'rails_helper'

RSpec.describe 'Event Search by location' do
  scenario 'When zip code entered into search box' do
    VCR.use_cassette("search_by_location") do
      # As a user, 
      visit root_path

      # When I fill in the search with 80202, 
      within('.navbar') do
        fill_in 'q', with: '8202'
      end
      # And I click Find Events, 
      click_on 'Find Events'

      # The current path is `/search`,
      expect(current_path).to eq(search_path)
      # And I can see a list of 16 events with a header `16 events for March', sorted by popularity. 
      expect(page).to have_content('Event count: 16')
      # For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
      expect(page).to have_content('Event name')
      expect(page).to have_content('Date & Time')
      expect(page).to have_content('Description')
      expect(page).to have_content('Venue name')
      expect(page).to have_content('Venue address')
      within("table") do
        expect(all("tr").count).to eq(17)
        within("tr:nth-of-type(2)") do
          within("td:nth-of-type(4)") do
            expect(page).to have_link
          end
        end
      end
    end
  end
end
