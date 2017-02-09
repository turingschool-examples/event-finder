class EventsService

  def self.find_by_zipcode
    events = Faraday.get("http://eventful.com/events?q=music&l=92103&within=10&units=miles")
    byebug
  end
end
