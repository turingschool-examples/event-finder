class Event

  def initialize(raw_event)
    @name = raw_event[:name]
    @datetime = raw_event[:]
    @description = raw_event[:]
    @description = raw_event[:]
    @venue_name = raw_event[:]
    @venue_url = raw_event[:]
    @venue_address = raw_event[:]
  end

  def find_by_zip(zipcode)
    EventService.find_by_zip(zipcode).map do |raw_event|
      new(raw_event)
    end
  end

  def shorten_description(description, max_length = 140)
    return description.slice(0, max_length) if description.length > max_length
    description
  end
end
