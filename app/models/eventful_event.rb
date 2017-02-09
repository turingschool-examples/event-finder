class EventfulEvent
  attr_reader :title,
              :date,
              :start_time,
              :description,
              :venue_name,
              :venue_url,
              :venue_address

  def initialize(data = {})
    @title = data["title"]
    @date = DateTime.parse(data["start_time"]).to_date if data["start_time"]
    @start_time = (DateTime.parse(data["start_time"])).strftime("%I:%M%p") if data["start_time"]
    @description = data["description"]
    @venue_name = data["venue_name"]
    @venue_url = data["venue_url"]
    @venue_address = data["venue_address"]
  end

  def self.by_zipcode(token, zipcode)
    raw_events = EventfulService.by_zipcode(token, zipcode)
    raw_events.map do |raw_event|
      self.new(raw_event)
    end
  end

end
