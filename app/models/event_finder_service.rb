class EventFinderService
  EVENTFINDER_API_URL_JSON = "http://api.eventful.com/json"
  ENDPOINT_EVENTS_SEARCH = "/events/search"
  EVENTFINDER_ENDPOINTS = {:search => ENDPOINT_EVENTS_SEARCH}

  def initialize(search_params = {})
    @_location = search_params[:location]
    @_result_limit = search_params[:limit] || "16"
    @_sort_by = search_params[:sort_by] || "popularity"
  end

  def events
    # raw_response = Faraday.get "#{EVENTFINDER_API_URL_JSON}#{ENDPOINT_EVENTS_SEARCH}?app_key=7J7CGGFM5zgs8RH7&location=#{@_location}&date=2017030100-2017033100&sort_order=#{@_sort_by}&page_size=#{@_result_limit}&page_number=1"
    raw_response = eventfinder_api_call
    response = JSON.parse(raw_response.body)
    response["events"]["event"]
  end

  def eventfinder_api_call
    Faraday.get "#{EVENTFINDER_API_URL_JSON}#{ENDPOINT_EVENTS_SEARCH}?app_key=7J7CGGFM5zgs8RH7&location=#{@_location}&date=2017030100-2017033100&sort_order=#{@_sort_by}&page_size=#{@_result_limit}&page_number=1"
  end

end