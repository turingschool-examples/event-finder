class EventfulService
  def initialize
  end

  def events(location)
    response = Faraday.get("http://api.eventful.com/json/events/search?&location=#{location}&sort_order=popularity&app_key=#{ENV["EVENTFUL_API_KEY"]}&date=march")
    raw_events = JSON.parse(response.body)["events"]["event"]
    raw_events.each { |event| Event.new(event) }
  end
end
