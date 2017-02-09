class EventfulService
  def self.search_by(zip)
    raw_response = Faraday.get "http://api.eventful.com/json/events/search?where=#{zip}&app_key=Q5gxTfWsVGgbDX8r&when=march&sort_order=popularity&page_size=16"
    response = JSON.parse(raw_response.body, symbolize_names: true)[:events][:event]
  end
end