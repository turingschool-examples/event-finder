class SearchController < ApplicationController

  def index
    response = EventfulService.find_by_zipcode(params[:q])
    @results = ResultsPresenter.new(response)
  end

end
