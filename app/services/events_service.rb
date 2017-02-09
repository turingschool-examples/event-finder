class EventsService

  def find_by_zip(zip)
    byebug
    response = Faraday.get("http://api.eventful.com/rest/events/search?location=#{zip}&api_key=g52t5VnTpTfh2pZM")
    JSON.parse(response.body, symbolize_names:true)
  end
end
