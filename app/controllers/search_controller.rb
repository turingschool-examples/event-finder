class SearchController < ApplicationController

  def index
    @events = Events.find_all(params[:q])
  end

end