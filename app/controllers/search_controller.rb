class SearchController < ApplicationController
  def index
    response = Faraday.get()
  end
end
