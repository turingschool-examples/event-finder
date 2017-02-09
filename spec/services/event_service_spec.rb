require 'rails_helper'

describe 'Event Service' do
  context '.conn' do
    it 'returns a Faraday object' do

      expect(EventService.conn).to be_a Faraday::Connection
    end
  end

  context '.find_all_by_zip' do
    it 'returns 16 raw events in March' do
      zip = 80202
      raw_events = EventService.find_all_by_zip(zip)

      expect(raw_events).to be_a Array
      expect(raw_events.count).to eq 16

      raw_event = raw_events.first




    end
  end
end
