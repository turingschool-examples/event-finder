class EventsService

  def self.find_by_zipcode(zipcode)
    response = Faraday.get("http://eventful.com/events?q=music&l=#{zipcode}/client_id=#{ENV["CLIENT_ID"]}")
    byebug
    events = JSON.parse(response.bodt)

  end
end
