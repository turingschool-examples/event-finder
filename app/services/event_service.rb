class EventService

  def self.find_all(zipcode)
    conn = Faraday.new(url: "http://api.eventful.com/rest/events/search") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get do |req|

    end
  end

end