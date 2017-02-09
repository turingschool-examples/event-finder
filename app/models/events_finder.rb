class EventsFinder

  def initialize(attributes = {})
  end

  def self.find_by_zip(zip)
    byebug
    EventsService.find_by_zip(zip).map do |raw_event|
      new(raw_event)
    end
  end

end
