class EventfulService
  def initialize
  end

  def events(location)
    response = Faraday.get("http://api.eventful.com/json/events/search?&location=#{location}&sort_order=popularity&app_key=#{ENV["EVENTFUL_API_KEY"]}&date=march&sort_direction=descending&page_size=16&include=popularity")
    raw_events = JSON.parse(response.body)["events"]["event"]
    raw_events.map { |event| Event.new(event) }
  end
end
