class Event
  attr_reader :name,
              :date_time,
              :description,
              :venue,
              :venue_address

  def initialize(attrs = {})

  end

  def self.list(params)
    response = EventService.new.gather_events(params)
    
    byebug
    .each do |event|
      new(event)
    end
  end
end