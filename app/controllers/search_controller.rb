class SearchController < ApplicationController
  def index
    @events = []
    byebug
    # raw_response = Faraday.get 'http://api.eventful.com/json/events/search?app_key=7J7CGGFM5zgs8RH7&location=80202&date=2017030100-2017033100&sort_order=popularity&page_size=16&page_number=1'
    raw_response = Faraday.get 'http://api.eventful.com/json/events/search?app_key=7J7CGGFM5zgs8RH7&location=#{params[:q]}&date=2017030100-2017033100&sort_order=popularity&page_size=16&page_number=1'
    response = JSON.parse(raw_response.body)
    requested_events = response["events"]["event"]
    requested_events.each do |one_event|
      @events << Event.new(one_event)
    end
    # @events = 
  end
end