class SearchController < ApplicationController

  def index
    EventfulEvent.by_zipcode(token, params[:q])
  end

  def token
    ENV["EVENTFUL_API_KEY"]
  end
end
