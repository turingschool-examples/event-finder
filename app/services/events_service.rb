class EventsService

  def self.find_by_zipcode(zipcode)
    response = Faraday.get("http://eventful.com/json/app_key=#{ENV["CLIENT_ID"]}/events?q=music&l=#{zipcode}")
      byebug
  end
end
