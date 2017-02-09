class SearchController < ApplicationController
  def index
    @events = EventPresenter.new(params[:q]).events_search
  end
end