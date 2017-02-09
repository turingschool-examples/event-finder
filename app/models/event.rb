class Event
  attr_reader :name,
              :date_time,
              :description,
              :venue,
              :venue_address

  def initialize(attrs = {})
    @name = attrs[]
    @name = attrs[]
    @name = attrs[]
    @name = attrs[]
    @name = attrs[]
    byebug
  end

  def self.list(params)
    response = EventService.new.gather_events(params)
    results = Hash.from_trusted_xml(response.body)
    
    results["search"]["events"]["event"].each do |event|
      new(event)
    end
  end
end