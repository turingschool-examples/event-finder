require 'rails_helper'

describe "As a user" do
  context "when I fill in my zipcode and click on 'Find Events'" do
    it "I should see a list of events" do
      visit root_path

      fill_in 'search', :with => '80202'
      click_on('Find Events')

      expect(current_path).to be('/search')
      # expect(events.count).to eq(16)
      # expect(page).to have_content('16 events for March')
      # expect(events).to ----- be sorted by popularity ----
      # events.each do |event|
        # expect(page).to have_content(event.name)
        # expect(page).to have_content(event.time)
        # expect(page).to have_content(event.description)
        # expect(page).to have_content(event.venue)
        # expect(page).to have_content(event.venue_address)
      # end
    end

  end
end
