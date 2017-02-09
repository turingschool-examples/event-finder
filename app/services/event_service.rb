class EventService

  def conn(location)
    Faraday.new(:url => 'http://api.eventful.com/rest/events/search?') do |faraday|
    # location=80202&page_count=1&app_key=2J7ttvFCd8S3W2vT
      faraday.params[:app_key] = ENV['API_KEY']
      faraday.params[:sort_order] = 'popularity'
      faraday.params[:page_size] = 16
      faraday.params[:page_number] = 1
      faraday.params[:location] = location
      faraday.adapter Faraday.default_adapter
    end
  end

  def gather_events(location)
    conn(location).get
  end

end