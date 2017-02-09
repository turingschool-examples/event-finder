class SearchController < ApplicationController
  def index
    @names = EventfulService.names
    binding.pry
  end
end