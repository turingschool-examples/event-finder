class EventsService

  def self.find_by_zipcode(zipcode)
    response = Faraday.get("http://api.eventful.com/json/app_key=#{ENV["CLIENT_ID"]}/events/search?...&location=#{zipcode}")
      byebug
  end
end
