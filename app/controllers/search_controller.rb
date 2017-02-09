class SearchController < ApplicationController
  def index
    search = EventfulService.new
    @names = search.names
    # binding.pry
  end
end