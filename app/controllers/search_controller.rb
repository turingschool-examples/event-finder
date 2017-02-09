class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.eventful.com/rest/events/search?app_key=MT9FKLGpN52KX9cX&location=80202&sort_order=popularity&page_size=16")
    binding.pry
  end
end