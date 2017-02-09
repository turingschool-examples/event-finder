class SearchController < ApplicationController
  def index
    zip = params[:q]
    date = "March"
    conn = Faraday.new(url: "http://api.eventful.com/json/events/search")
    response = conn.get do |p|
      p.params[:app_key] = "BKCFLWH22GnWSjtM"
      p.params[:location] = zip
      p.params[:date] = date
    end
    found = JSON.parse(response.body)
    @events = found['events']['event']
  end
end
