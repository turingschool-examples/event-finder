require 'rails_helper'

describe 'Event' do

  let(:attributes) {
      { start_time: DateTime.now,
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
  end
end




#   def self.find_all_by_zip(zip)
#     EventService.find_all_by_zip(zip).map { |raw_event| new(raw_event) }
#   end

#   def abbreviated_description
#     description[0..139] if description
#   end
# end
