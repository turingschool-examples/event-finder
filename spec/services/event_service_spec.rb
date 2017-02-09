require 'rails_helper'

describe 'Event Service' do
  context '.conn' do
    it 'returns a Faraday object' do

      expect(EventService.conn).to be_a Faraday::Connection
    end
  end

  context '.find_all_by_zip' do
    before do
      VCR.insert_cassette 'event_service_response', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns 16 raw events in March' do
      zip = '80202'
      raw_events = EventService.find_all_by_zip(zip)


      expect(raw_events).to be_a Array
      expect(raw_events.count).to eq 16

      raw_event = raw_events.first

      expected_keys = [:description, :start_time, :title,
        :venue_address, :venue_name, :venue_url]

      expected_keys.each do |key|
        expect(raw_event).to have_key key
      end

      expect(raw_event[:postal_code]).to eq zip
    end
  end
end













