class SearchController < ApplicationController
  def index
    zip = params['q']
    @events = Event.find_all_by_zip(zip)
  end
end