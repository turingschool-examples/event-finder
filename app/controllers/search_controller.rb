class SearchController < ApplicationController

  def index
    @result = EventfulService.search_by_zipcode(params[:q])    
    byebug
  end

end
