class Event
  attr_reader :name, :time, :descripton, :venue_name, :venue_address
  def initialize(data)
    @name = data[:title]
    @time = data[:start_time]
    @description = data[:descripton]
    @venue_name = data[:venue_name]
    @venue_address = data[:venue_address]
  end
  def self.get_events(data)
    data.map do |event|
      Event.new(event)
    end
  end
end
