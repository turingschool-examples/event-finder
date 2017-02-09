class SearchController < ApplicationController
  def index
    raw_response = Faraday.get "http://api.eventful.com/json/events/search?where=80202&app_key=Q5gxTfWsVGgbDX8r&when=march&sort_order=popularity"
    response = JSON.parse(raw_response.body, symbolize_names: true)[:events][:event]
    @events = response.map do |event|
      Event.new(event)
    end
  end
end

class Event

  attr_reader :name, 
              :description,
              :start_time,
              :venue,
              :venue_url,
              :venue_address

  def initialize(event)
    @name = event[:title]
    @description = event[:description]
    @start_time = event[:start_time]
    @venue = event[:venue_name]
    @venue_url = event[:venue_url]
    @venue_address = event[:venue_address]
  end

end