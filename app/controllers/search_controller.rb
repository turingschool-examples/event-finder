class SearchController < ApplicationController
  def index
    @events = Event.find_by_zip(params[:q])
  end
end
