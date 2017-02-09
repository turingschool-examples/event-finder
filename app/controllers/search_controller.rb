class SearchController < ApplicationController
  def index
    zipcode = params[:q]
    response = Faraday.get("http://api.eventful.com/json/events/search?location=#{zipcode}&total_items=16&date=March&sort_order=popularity&app_key=#{ENV["eventful_app_key"]}")
    @events = JSON.parse(response.body)["events"]["event"]
    byebug
  end
end
