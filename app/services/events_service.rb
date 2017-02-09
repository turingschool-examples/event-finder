class EventsService

  def self.find_by_zipcode(zipcode)
    response = Faraday.get("http://eventful.com/app_key=#{ENV["CLIENT_ID"]}/json/events?q=music&l=#{zipcode}")
      byebug
  end
end
