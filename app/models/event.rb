class Event

  attr_reader :name, 
              :description,
              :start_time,
              :venue,
              :venue_url,
              :venue_address

  def initialize(event)
    @name = event[:title]
    @description =  shorten(event[:description])
    @start_time = event[:start_time]
    @venue = event[:venue_name]
    @venue_url = event[:venue_url]
    @venue_address = event[:venue_address]
  end

  def shorten(description)
    return description[0..140] if description
  end

  def self.search_by_zip
    response = EventfulService.search_by_zip
    response.map do |event|
      new(event)
    end
  end
end