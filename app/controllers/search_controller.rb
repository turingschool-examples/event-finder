class SearchController < ApplicationController
  def index
    @events = EventfulEvents.within_zip(params[:q])
  end
end
