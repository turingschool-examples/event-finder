require 'rails_helper'

RSpec.describe EventFinder do 
  context '.closest_to_zip(zip) method' do 
    it 'returns events closest to that zipcode' do
        raw_events = EventFinder.closest_to_zip("80202")

        expect(raw_events).to be_an(Array)
        
        event = raw_events.first
        expect(event).to be_a(Hash)
    end
  end
end