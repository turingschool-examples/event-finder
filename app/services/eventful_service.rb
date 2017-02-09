class EventfulService

  def connect
    response = Faraday.get("https://api.eventful.com/json/events/search?app_key=MT9FKLGpN52KX9cX&location=80202&sort_order=popularity&page_size=16")
    JSON.parse(response.body, symbolize_names: true)
  end

  def events_hash
    events_list = {}
    connect[:events][:event].each do |event|
      events_list[:name] = event[:title]
      events_list[:date_and_time] = event[:start_time]
      events_list[:description] = event[:description] || ""
    end
    events_list
    binding.pry
  end

  

end