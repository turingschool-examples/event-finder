class SearchController < ApplicationController

def index
  @events = EventsFinder.find_by_zip(params[:q])
end

end
