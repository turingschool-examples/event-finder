class SearchController < ApplicationController
  def index
    @events = EventFinder.closest_to_zip(params[:q])
  end
end