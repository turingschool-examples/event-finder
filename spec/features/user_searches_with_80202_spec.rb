describe "User" do
  it "searches with 80202" do
    visit root_path

    fill_in "search", with: '80202'
    click_on "Find Events"

    expect(current_path).to eq(search_path)

    expect(page).to have_content('16 events for March, sorted by popularity')

    expect(page).to have_content("Event Name")
    expect(page).to have_content("Date & Time")
    expect(page).to have_content("Description")
    expect(page).to have_content("Venue Name")
    expect(page).to have_content("Venue Address")
    # As a user,
    # When I fill in the search with 80202,
    # And I click Find Events,


    # The current path is `/search`,
    # And I can see a list of 16 events with a header `16 events for March', sorted by popularity.
    # For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
  end
end
