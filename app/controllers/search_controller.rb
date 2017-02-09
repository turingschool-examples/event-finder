class SearchController < ApplicationController
  def index
    @events = EventfulService.new.events(event_params)
  end

  private

    def event_params
      params.permit("q")
    end
end
