class EventfulService
  def initialize
  end

  def events(location)
    response = Faraday.get("http://api.eventful.com/json/events/search?&location=#{location}&sort_order=popularity&app_key=#{ENV["EVENTFUL_API_KEY"]}")
    raw_events = JSON.parse(response.body)["events"]
    raw_events.each { |event| Event.create(event) }
  end
end
