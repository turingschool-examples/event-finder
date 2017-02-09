class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    response = Faraday.get "http://api.eventful.com/json/events/search?app_key=8gWGVrJnPdvtqFrq&location=#{zip_code}&sort_order=popularity&page_size=16"
    parsed = JSON.parse(response.body, symbolize_names: true)[:events][:event]

    @events = Event.get_events(parsed)
    binding.pry
  end
end

class Event
  attr_reader :title, :start_time, :descripton, :venue_name, :venue_address
  def initialize(data)
    @name = data[:title]
    @time = data[:start_time]
    @description = data[:descripton]
    @venue_name = data[:venue_name]
    @venue_address = data[:venue_address]
  end
  def self.get_events(data)
    data.map do |event|
      Event.new(event)
    end
  end
end
