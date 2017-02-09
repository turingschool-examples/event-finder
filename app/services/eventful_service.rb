class EventfulService

  def initialize
    response = Faraday.get("https://api.eventful.com/json/events/search?app_key=&location=80202&sort_order=popularity&page_size=16")
    @data = JSON.parse(response.body)
  end

  def self.names
    @data[:events][:event].map do |event|
      event[:title]
    end
  end

end