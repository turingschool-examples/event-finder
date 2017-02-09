class EventsService

  def self.find_by_zipcode(zipcode)
    response = Faraday.get("http://eventful.com/app_key=#{ENV["CLIENT_ID"]}events/search?...location=#{zipcode}.json")
    events = JSON.parse(response.body)
    by3ebug

  end
end
