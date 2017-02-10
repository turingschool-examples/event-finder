class SearchController < ApplicationController
  def index
    @events = Event.search_by_zip(params[:q])
  end
end
