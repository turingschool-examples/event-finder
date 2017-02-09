class EventFinder
  def initialize(attributes ={})
    @attrs = attributes
    # @title = attributes[:title]
    # @venue = attributes[:venue_name]
    # @city = attributes[:city_name]
    # @state = attributes[:region_name]
  end

  def attendees
    @attrs[:going] + @attrs[:going_count] = @attrs[:watching_count]
  end

  def self.closest_to_zip(zip)
    EventFinderService.closest_to_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end
end