class EventfulService
  def self.get_events(zip_code)
    response = Faraday.get "http://api.eventful.com/json/events/search?app_key=8gWGVrJnPdvtqFrq&location=#{zip_code}&sort_order=popularity&page_size=16"
    parsed = JSON.parse(response.body, symbolize_names: true)[:events][:event]
  end
end
