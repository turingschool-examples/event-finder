class SearchController < ApplicationController
  def index
    search = EventfulService.new
    @names = search.events_hash
    # binding.pry
  end
end