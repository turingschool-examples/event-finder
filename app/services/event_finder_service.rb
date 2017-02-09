class EventFinderService
  def self.closest_to_zip(zip)
    response = Faraday.get("http://api.eventful.com/json/events/search?app_key=gMFJBD23kJG6RWQN&location=#{zip}")
    JSON.parse(response.body, symbolize_names: true)[:events]
  end
end