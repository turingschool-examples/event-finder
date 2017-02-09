class EventFinderService
  def self.closest_to_zip(zip)
    response = Faraday.get("http://api.eventful.com/rest/events/search?location=#{zip}")
    JSON.parse(response.body, symbolize_names: true)[:events]
  end
end