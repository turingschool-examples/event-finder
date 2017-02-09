class Event

  attr_reader :name,
              :datetime,
              :description,
              :venue_name,
              :venue_url,
              :venue_address

  def initialize(raw_event)
    @name = raw_event["title"]
    @datetime = raw_event["start_time"]
    @description = raw_event["description"]
    @venue_name = raw_event["venue_name"]
    @venue_url = raw_event["venue_url"]
    @street_address = raw_event["venue_address"]
    @city = raw_event["city_name"]
    @state = raw_event["region_name"]
    @zipcode = raw_event["postal_code"]
  end

  def self.find_by_zip(zipcode)
    EventService.find_by_zip(zipcode).map do |raw_event|
      new(raw_event)
    end
  end

  def shorten_description(description, max_length = 140)
    return description.slice(0, max_length) if description.length > max_length
    description
  end

  def venue_address
    "#{@street_address} #{@city_name}, #{@state} #{@zipcode}"
  end
end
