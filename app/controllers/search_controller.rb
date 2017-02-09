class SearchController < ApplicationController

  def index
    @events = EventfulEvent.by_zipcode(token, params[:q])
  end

  def token
    ENV["EVENTFUL_API_KEY"]
  end
end
