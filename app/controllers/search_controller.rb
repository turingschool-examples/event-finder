class SearchController < ApplicationController
  def index
    zipcode = params[:q]
    byebug
    response = Faraday.get("http://api.eventful.com/json/events/search?location=#{zipcode}&total_items=16&date=March&app_key=#{ENV['EVENTFUL_API_KEY']}")
    @events = response.body
  end
end
