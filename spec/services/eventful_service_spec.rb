require 'rails_helper'

describe EventfulService do
  context ".events" do
    scenario "returns a list of events", :vcr => true do
      raw_events = EventfulService.by_zipcode(token, zipcode)
      expect(raw_events).to be_an Array

      event = raw_events.first
      expect(raw_events.first).to have_key "title"
      expect(raw_events.first).to have_key "start_time"
      expect(raw_events.first).to have_key "description"
      expect(raw_events.first).to have_key "venue_name"
      expect(raw_events.first).to have_key "venue_url"
      expect(raw_events.first).to have_key "venue_address"
    end
  end
end
