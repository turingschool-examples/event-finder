class SearchController < ApplicationController
  def index
    @events = Event.search_by(params[:q])
  end
end
