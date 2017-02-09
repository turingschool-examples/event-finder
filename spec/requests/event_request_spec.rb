require 'rails_helper'

describe "Event Finder", type: :request do
  it "renders events in march sorted by popularity" do
    VCR.use_cassette("event_finder_api") do
      
      # expect(response).to be_success
    end
  end
end