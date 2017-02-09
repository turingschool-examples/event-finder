class EventfulService

  def connect
    response = Faraday.get("https://api.eventful.com/json/events/search?app_key=MT9FKLGpN52KX9cX&location=80202&sort_order=popularity&page_size=16")
    JSON.parse(response.body, symbolize_names: true)
  end

  def names
    connect[:events][:event].map do |event|
      event[:title]
    end
  end

end