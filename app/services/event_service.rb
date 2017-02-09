class EventService

  def self.find_all(zipcode)
    conn = Faraday.new(url: "http://api.eventful.com/json/events/search") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get do |req|
      req.params[:app_key] = "RwHdW4tXKrczPzjZ"#would be hidden in a real app
      req.params[:location] = "#{zipcode}"
      req.params[:within] = 10
      req.params[:date] = "March"
      req.params[:sort_order] = 'popularity'
    end
    events = JSON.parse(response.body)['events']
  end
end