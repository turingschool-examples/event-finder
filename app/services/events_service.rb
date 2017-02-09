class EventsService

  def self.find_by_zip(zip)
    response = Faraday.get("http://api.eventful.com/json/events/search?location=#{zip}&app_key=g52t5VnTpTfh2pZM")
    JSON.parse(response.body, symbolize_names:true)[:events][:event]
  end
end
