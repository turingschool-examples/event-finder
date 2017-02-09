require 'rails_helper'

describe EventfulService do
  it "can search events by zip" do
    VCR.use_cassette("eventful_find_by_zip") do
      response = EventfulService.search_by("80202")

      expect(response.count).to eq 16
      expect(response.first[:title]).to eq 'Experience Hendrix'
      expect(response.last[:venue_name]).to eq 'Summit Music Hall'
    end
  end
end