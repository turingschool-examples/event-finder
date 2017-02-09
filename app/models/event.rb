class Event

  attr_reader :start_time,
              :description,
              :title,
              :venue_address,
              :venue_name,
              :venue_url

  def initialize(raw_event)
    @description    = raw_event[:description]
    @start_time     = raw_event[:start_time]
    @title           = raw_event[:title]
    @venue_address  = raw_event[:venue_address]
    @venue_name     = raw_event[:venue_name]
    @venue_url      = raw_event[:venue_url]
  end

  def self.find_all_by_zip(zip)
    EventService.find_all_by_zip(zip).map { |raw_event| new(raw_event) }
  end

  def abbreviated_description
    description[0..139] if description
  end

  def pretty_start_time
    DateTime.parse(start_time).inspect
  end
end
