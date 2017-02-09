class SearchController < ApplicationController
  def index
    raw_response = Faraday.get 'http://api.eventful.com/json/events/search?app_key=7J7CGGFM5zgs8RH7&location=80202&date=2017030100-2017033100&sort_order=popularity'
    response = JSON.parse(raw_response.body)
    byebug
    # @events = 
  end
end