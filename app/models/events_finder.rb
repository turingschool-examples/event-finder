class EventsFinder

  attr_reader :event_name,
              :formatted_date_time,
              :event_description,
              :event_venue_name,
              :event_venue_address,
              :event_venue_url

  def initialize(attributes = {})
    @event_name = attributes[:title]
    @event_date_time = attributes[:start_time]
    @event_description = attributes[:description] # This needs to be changed to render HTML instead of JSON
    @event_venue_name = attributes[:venue_name]
    @event_venue_address = attributes[:venue_address]
    @event_venue_url = attributes[:venue_url]
    @attributes = attributes
  end

  def formatted_date_time
    @event_date_time.to_s
  end

  # def sort_by_popularity
  #   # Get all the events, order by [:going_count] desc.
  # end

  def self.find_by_zip(zip)
    EventsService.find_by_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end

end
