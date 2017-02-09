class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.eventful.com/events")
    binding.pry
  end
end