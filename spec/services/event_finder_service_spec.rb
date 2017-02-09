require 'rails_helper'

RSpec.describe EventFinderService do 
  context '.closest_to_zip(zip) method' do 
    it 'returns events closest to that zipcode' do
        raw_events = EventFinderService.closest_to_zip("80202")

        expect(raw_events).to be_a(Hash)
        
        event = raw_events.first
        expect(event).to be_a(Array)
    end
  end
end