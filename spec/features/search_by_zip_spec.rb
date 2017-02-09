require 'rails_helper'

describe "As a user" do
  context "when I fill in my zipcode and click on 'Find Events'" do
    it "I should see a list of events" do
      visit root_path

      fill_in :q, :with => '80202'
      click_on('Find Events')

      expect(current_path).to eq('/search') # passing!
      expect(page).to have_content('16 Events for March') # passing!
      expect(page).to have_css("h2", :count => 16) # test is failing correctly
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
