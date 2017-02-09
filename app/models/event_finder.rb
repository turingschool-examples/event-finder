class EventFinder
  def initialize(attributes ={})
  end

  def self.closest_to_zip(zip)
    EventFinderService.closest_to_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end
end