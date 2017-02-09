class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    parsed = Service.get_events(zip_code)


    @events = Event.get_events(parsed)
  end
end
