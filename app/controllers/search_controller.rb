class SearchController < ApplicationController
  def index
    @events = Event.search_by_zip
  end
end
