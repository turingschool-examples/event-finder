class EventfulService
  
  def self.search_by_zipcode(zipcode)
    response = Faraday.get("http://api.eventful.com/json/events/search?location=#{zipcode}&app_key=#{ENV["EVENTFUL_API_KEY"]}&month=march&sort_order=popularity&page_size=16")
    JSON.parse(response.body)
  end

end
