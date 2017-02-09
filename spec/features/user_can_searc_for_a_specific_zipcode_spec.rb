require 'rails_helper'

describe "zipcode search" do
  it "user can search for events by a specific zipcode" do

    visit root_path

    fill_in "Find Events", with: "80202"
    click_on "Find Events"

    expect(current_path).to eq("/search")
    expect(page).to have_content("16 events for March")

    events = JSON.parse(response.body)
    event  events.first


    exepect(events.count).to eq(16)
  end
end
