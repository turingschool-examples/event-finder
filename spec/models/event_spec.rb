require 'rails_helper'

describe 'Event' do

  let(:attributes) {
      { start_time: DateTime.now.to_s,
        description: "Description",
        title: "Name", 
        venue_address: "341 W. 27th Ave.",
        venue_name: "Venue Name",
        venue_url: "www.example.com"
      }
  }

  let(:event) { Event.new(attributes) }

  context '.new' do
    it 'initializes with attributes hash' do

      expect(event).to be_a Event
    end
  end

  context 'attributes' do
    it 'returns value' do

      attributes.each do |key, value|
        expect(event.send(key)).to eq value
      end
    end

    context '.find_all_by_zip' do
      before do
        VCR.insert_cassette 'event_service_response', record: :new_episodes
      end

      after do
        VCR.eject_cassette
      end

      it 'returns 16 event objects' do
        zip ='80202'
        events = Event.find_all_by_zip(zip)

        expect(events).to be_a Array
        expect(events.count).to eq 16
        events.each do |event|
          expect(event).to be_a Event
        end
      end
    end

    context 'abbreviated_description' do
      it 'shortes description to 139 characters' do
        expected = event.description[0..139]

        expect(event.abbreviated_description).to eq expected
      end
    end

    context '#pretty_start_time' do
      it 'returns formatted start time' do
        expected = DateTime.parse(event.start_time).inspect

        expect(event.pretty_start_time).to eq expected
      end
    end
  end
end
