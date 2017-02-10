require 'rails_helper'

describe EventfulService do
  context ".search_by_zip(zip)" do
    it "returns a list of events by zip", :vcr do
      raw_events = EventfulService.search_by_zip("80202")
      raw_event  = raw_events.first
      expect(raw_events.count).to eq(16)
      expect(raw_event).to have_key(:title)
      expect(raw_event).to have_key(:description)
      expect(raw_event).to have_key(:start_time)
      expect(raw_event).to have_key(:venue_name)
      expect(raw_event).to have_key(:venue_url)
      expect(raw_event).to have_key(:venue_address)
    end
  end
end
