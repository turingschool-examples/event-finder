class SearchController < ApplicationController

  def index
    @events = FindEvents.find_by_zipcode
  end

end
