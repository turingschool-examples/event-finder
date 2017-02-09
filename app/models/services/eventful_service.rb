class EventfulEvents
  def within_zipcode(zip)
    response = Faraday.get("http://eventful.com/events?location=#{zip}&api_key=#{ENV["EVENTFUL_KEY"]}&date=All")
    JSON.parse(response.body, symbolize_names: true)
  end
end
