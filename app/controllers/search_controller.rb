class SearchController < ApplicationController

  def index
    @events = FindEvents.find_by_zipcode(params[:q])
    byebug
  end

end
