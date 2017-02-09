require 'rails_helper'

describe Event do
  it "can search events by zip" do
    VCR.use_cassette("eventful_find_by_zip") do
      events = Event.search_by("80202", "3")

      expect(events.count).to eq 16
      expect(events.first.name).to eq 'Experience Hendrix'
      expect(events.last.venue).to eq 'Summit Music Hall'
    end
  end
end
