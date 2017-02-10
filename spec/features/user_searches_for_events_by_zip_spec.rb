require 'rails_helper'

describe "User searches for events by zip" do
  scenario "returns a list of 16 events sorted by popularity" do
    json = File.read("./spec/fixtures/event_search.json")
    parsed_response = JSON.parse(json, symbolize_names: true)[:events][:event]

    expect_any_instance_of(EventfulService).to receive(:search).with(
      {location: "80202"}
    ).and_return(parsed_response)

    visit root_url

    fill_in :q, :with => "80202"

    click_on "Find Events"

    within("h2") do
      expect(page).to have_content("16 events for March")
    end

    expect(page).to have_css(".event", :count => 16)

    within(".event", match: :first) do
      expect(page).to have_content "Experience Hendrix"
      expect(page).to have_content "1621 Glenarm Place"
      expect(page).to have_content "2017-03-07 19:30:00"
      expect(page).to have_link("Paramount Theatre")
    end
  end
end
