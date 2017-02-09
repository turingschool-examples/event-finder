class SearchController < ApplicationController

  def index
    @result = EventfulService.search_by_zip(params[:q])    
  end

end
