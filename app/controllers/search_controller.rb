class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.eventful.com/json/events/search?app_key=#{ENV['EVENTFUL_KEY']}&location=80202&sort_order=popularity&page_size=16")
    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end