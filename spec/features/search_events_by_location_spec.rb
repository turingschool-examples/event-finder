require 'rails_helper'

RSpec.describe 'Event Search by location' do
  scenario 'When zip code entered into search box' do
    # As a user, 
    visit root path

    # When I fill in the search with 80202, 
    within('.navbar') do
      fill_in 'q', with: '8202'
    end
    # And I click Find Events, 
    click_on 'Find Events'

    expect(current_path).to eq()
The current path is `/search`,
And I can see a list of 16 events with a header `16 events for March', sorted by popularity. 
For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
  end
end
