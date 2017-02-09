class EventService

  def self.find_all(zipcode)
    conn = Faraday.new(url: "http://api.eventful.com/rest/events/search") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    xml = conn.get do |req|
      req.params[:app_key] = "RwHdW4tXKrczPzjZ"
      req.params[:location] = "#{zipcode}"
      req.params[:within] = 10
      req.params[:date] = "March"
      req.params[:sort_order] = 'popularity'
    end
    response = Crack::XML.parse(File.read(xml))
    # events = JSON.parse(response.body)
  end

end