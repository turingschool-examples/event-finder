class EventsFinder

  def initialize(attributes = {})
    @total_events = [:total_items]
  end

  def self.find_by_zip(zip)
    EventsService.find_by_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end

end
