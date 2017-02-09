class SearchController < ApplicationController
  def index
    
    @events = Event.search_by_zip
    # @events = response.map do |event|
    #   Event.new(event)
    # end
  end
end
