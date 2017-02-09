class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.eventful.com/events?app_key=#{ENV['EVENTFUL_KEY']}&l=80202&sort_order=popularity&page_size=16")
    binding.pry
  end
end