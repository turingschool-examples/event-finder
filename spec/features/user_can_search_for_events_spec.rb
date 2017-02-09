require "rails_helper"

# As a user,
# When I fill in the search with 80202,
# And I click Find Events,
# The current path is `/search`,
# And I can see a list of 16 events with a header `16 events for March', sorted by popularity.
# For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.

RSpec.feature 'Search', type: :feature do
  scenario "user searches for events" do
    it 'returns matching events' do
      visit root_path

      fill_in q, with: '80202'
      click_on "Find Events"

      expect(current_path).to eq('/search')
      expect(page).to have_content('16 events for March')
      within(:ul) do
        within first(:li) do
          expect(page).to have_content(event.name)
          expect(page).to have_content(event.date)
          expect(page).to have_content(event.time)
          expect(page).to have_content(description)
          expect(event.description.length).to <= (140)
          expect(page).to have_link(event.venue.name)
          expect(page).to have_content(event.venue.address)
        end
      end
    end
  end
end
