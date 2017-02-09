class EventfulService
  def self.search_by_zip
    raw_response = Faraday.get "http://api.eventful.com/json/events/search?where=80202&app_key=Q5gxTfWsVGgbDX8r&when=march&sort_order=popularity"
    response = JSON.parse(raw_response.body, symbolize_names: true)[:events][:event]
  end
end