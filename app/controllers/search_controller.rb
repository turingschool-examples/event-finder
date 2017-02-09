class SearchController < ApplicationController

def index
  @events = EventsFinder.find_by_zip(params[:zip])
end

end
