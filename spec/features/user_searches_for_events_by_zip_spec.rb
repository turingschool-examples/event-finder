# As a user, 
# When I fill in the search with 80202, 
# And I click Find Events, 
# The current path is `/search`,
# And I can see a list of 16 events with a header `16 events for March', sorted by popularity. 
# For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
require 'rails_helper'

describe 'User' do
  context 'searches by zip code' do
    it 'sees events in March sorted by popularity' do
      visit root_path
      fill_in 'q', with: 80202
      click_on 'Find Events'

      expect(current_path).to eq search_path
      expect(page).to have_content '16 events for March'
      

    end
  end
end