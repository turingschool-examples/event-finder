require "rails_helper"

RSpec.describe "EventfulService", type: :model do
  describe "#events" do
    it "returns events for given parameters" do
      VCR.use_cassette("events") do
        params = {location: 80202, sort_order: "popularity"}
        service = EventfulService.new
        events  = service.events(params)
        event = events.first

        expect(event)
      end
    end
end
