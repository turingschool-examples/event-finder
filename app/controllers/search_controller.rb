class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    response = Faraday.get "http://api.eventful.com/json/events/search?app_key=8gWGVrJnPdvtqFrq&location=#{zip_code}&sort_order=popularity&page_size=16"
    parsed = JSON.parse(response.body, symbolize_names: true)[:events][:event]

    @events = Event.get_events(parsed)
  end
end
