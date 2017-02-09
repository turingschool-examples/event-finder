class EventService

  def conn(location)
    Faraday.new(:url => 'http://api.eventful.com/rest/events/search?') do |faraday|
    # location=80202&page_count=1&app_key=2J7ttvFCd8S3W2vT
      faraday.params[:location] = location
      faraday.params[:app_key] = ENV'API_KEY'
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.gather_events(location)
    JSON.parse(conn(location).body)
  end

end