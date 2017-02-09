class SearchController < ApplicationController
  def index
    raw_response = Faraday.get "http://api.eventful.com/json/events/search?where=80202&app_key=Q5gxTfWsVGgbDX8r&when=march&sort_order=popularity&page_size=16&page_number=1"
    byebug
    response = JSON.parse(raw_response.body, symbolize_names: true)
  end
end