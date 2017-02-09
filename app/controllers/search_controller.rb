class SearchController < ApplicationController
  def index
    @events = EventPresenter.new(params[:q]).events_search
    byebug
  end
end