class Event

  attr_reader :name,
              :datetime,
              :description,
              :venue_name,
              :venue_url,
              :venue_address

  def initialize(raw_event)
    @name = raw_event[:name]
    @datetime = raw_event[:tbd]
    @description = raw_event[:tbd]
    @venue_name = raw_event[:tbd]
    @venue_url = raw_event[:tbd]
    @venue_address = raw_event[:tbd]
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
end
