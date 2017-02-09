class EventsFinder

  attr_reader :event_name,
              :event_start_time,
              :event_description,
              :event_venue_name,
              :event_venue_address,
              :event_venue_url

  def initialize(attributes = {})
    @event_name = attributes[:title]
    @event_date_time = attributes[:start_time]
    @event_description = attributes[:description]
    @event_venue_name = attributes[:venue_name]
    @event_venue_address = attributes[:venue_address]
    @event_venue_url = attributes[:venue_url]
  end

  def self.find_by_zip(zip)
    EventsService.find_by_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end

end
