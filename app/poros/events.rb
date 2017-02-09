class Events

  attr_reader :title, :date_time, :description, :venue, :venue_address, :url

  def initialize(attributes={})
    @title         = attributes['title']
    @date_time     = attributes['start_time'] 
    @description   = attributes['description']
    @venue         = attributes['venue_name']
    @venue_address = attributes['venue_address']
    @url           = attributes['venue_url']
  end


  def self.find_all(zip_code)
    EventService.find_all(zip_code).map do |event|
      event[1].map do |eve|
        new(eve)
      end
    end
  end

end