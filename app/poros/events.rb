class Events

  def initialize(attributes={})
    binding.pry
    @event_name = attributes['']
  end


  def self.find_all(zip_code)
    EventService.find_all(zip_code).map do |event|
      new(event)
    end
  end

end