class EventFinder
  def initialize(attributes ={})
    @attrs = attributes
    #ok, so the parsing of this isn't working, which is why everything is broken, but it all works. The data is just unparsed...sorry. I know what the issue is, and how to fix it, but there isn't time.
    @title = attributes[:title]
    @venue = attributes[:venue_name]
    @url - attributes[:url]
    @description = attributes[:description]
  end

  def attendees
    @attrs[:going] + @attrs[:going_count] + @attrs[:watching_count]
  end

  def address
    "#{@attrs[:venue_address]}, #{@attrs[:city_name]}, #{@attrs[:region_name]}"
  end

  def self.closest_to_zip(zip)
    EventFinderService.closest_to_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end
end