class Event
  attr_reader :name,
              :date_time,
              :description,
              :venue,
              :venue_address

  def initialize(attrs = {})
    @name = attrs["title"]
    @date_time = attrs["start_time"]
    @description = attrs["description"]
    @venue = attrs["venue_name"]
    @venue_address = attrs["venue_address"]
  end

  def self.list(params)
    response = EventService.new.gather_events(params)
    results = Hash.from_trusted_xml(response.body)

    results["search"]["events"]["event"].map do |event|
      new(event)
    end
  end
end