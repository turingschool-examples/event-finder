class SearchController < ApplicationController
  def index
    zip = params[:q]
    date = "March"
    conn = Faraday.post("http://api.eventful.com/rest/events/search?BKCFLWH22GnWSjtMs&location=zip&") do |faraday|
      faraday.get
    end


  end
end
