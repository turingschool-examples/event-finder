class EventFinderService
  def initialize(search_params = {})
    @_location = search_params[:location]
    @_number_of_results = search_params[:limit] || "16"
    @_sort_by = search_params[:sort_by] || "popularity"
  end

  def events
    raw_response = Faraday.get "http://api.eventful.com/json/events/search?app_key=7J7CGGFM5zgs8RH7&location=#{@_location}&date=2017030100-2017033100&sort_order=popularity&page_size=16&page_number=1"
    response = JSON.parse(raw_response.body)
    response["events"]["event"]
  end
end