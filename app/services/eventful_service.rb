class EventfulService

  def self.by_zipcode(token, zipcode)
   response = Faraday.get("http://api.eventful.com/json/events/search?app_key=fQzwFNc4ksLVxn9M&location=#{zipcode}&page_size=16&sort_order=popularity")
   events = JSON.parse(response.body)["events"]["event"]
  end
end
