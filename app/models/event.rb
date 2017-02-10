class Event
  attr_reader :name, :description, :start_time, :venue, :url, :address

  def initialize(attrs = {})
    @name = attrs[:title]
    @description = attrs[:description] || ""
    @start_time = attrs[:start_time]
    @venue = attrs[:venue_name]
    @url = attrs[:venue_url]
    @address = attrs[:venue_address]
  end

  def self.search_by_zip(zip)
    EventfulService.search_by_zip(zip).map do |raw_event|
      Event.new(raw_event)
    end
  end
end
