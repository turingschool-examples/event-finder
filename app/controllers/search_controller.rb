class SearchController < ApplicationController
  def index
    response = Faraday.get 'http://api.eventful.com/rest/events/search?app_key=7J7CGGFM5zgs8RH7&location=80202&date=2017030100-2017033100&sort_order=popularity'
    byebug
    # @events = 
  end
end