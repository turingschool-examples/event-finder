class SearchController < ApplicationController
  def index
    @events = Event.get_events(params[:q])
  end
end
