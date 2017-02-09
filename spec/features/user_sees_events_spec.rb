require 'rails_helper'

describe "As a user" do
  describe "I see relevant events" do
    # As a user,
    User.create(name: "John")
    visit root_path
    # When I fill in the search with 80202,
    fill_in with: "80202"
    # And I click Find Events,
    click_on "Find Events"
    # The current path is `/search`,
    expect(current_path).to eq "/search"
    # And I can see a list of 16 events with a header `16 events for March', sorted by popularity.
    expect(page).to have_content("16 Events for March")
    expect(Event).to be_an(Array)
    expect(Event.first).to be_a(Hash)
    expect(Event.count).to be(16)
    # For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
    expect(Event.first).to have_content(:address)
    expect(Event.first).to have_content(:description)
    expect(Event.first).to have_content(:date)
  end
end
