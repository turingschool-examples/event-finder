class EventsFinder

  attr_reader: :title, :start_time, :description, :veune_name, :venue_address, :venue_url

  def initialize(attributes = {})
    # Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
    @event_name = attributes[:title]
    @event_date_time = attributes[:start_time]
    @event_description = attributes[:description]
    @event_venue_name = attributes[:venue_name]
    @event_venue_address = attributes[:venue_address]
    @event_venue_url = attributes[:venue_url]
    # @total_events = [:events][:event].count
  end

  def self.find_by_zip(zip)
    EventsService.find_by_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end

end
