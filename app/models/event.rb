class Event
  attr_reader :name,
              :date_time,
              :description,
              :venue,
              :venue_address

  def initialize(attrs = {})

  end

  def self.list(params)
    EventService.gather_events(params).each do |event|
      new(event)
    end
  end
end