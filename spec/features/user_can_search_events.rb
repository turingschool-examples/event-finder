require "rails_helper"

describe "When a user searches for events by zipcode" do
  before do
    visit root_path
    fill_in :q, with: "80202"
    click_on "Find Events"
  end

  it "they see the events for that zipcode" do
    expect(current_path).to eql(search_path) #search_path should eql '/search'
    expect(page).to have_css("h1", "16 events for March")
    expect(page).to have_css(".event", count: 16)
    events.each do |event|
      expect(page).to have_content(event.name)
      expect(page).to have_content(event.datetime) # need to see both the date and time
      expect(page).to have_content(event.description)
      expect(description.length).to be <= 140 #description must be shortened to 140 characters or less
      expect(page).to have_link(event.venue_name, href: "#{event.venue_url}")
      expect(page).to have_content(event.venue_address)
    end
    # make sure they're sorted by popularity
  end

end
