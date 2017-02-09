class SearchController < ApplicationController
  def index
    zip = params[:q]
    date = "March"
    conn = Faraday.new(url: "http://api.eventful.com/rest/events/search")
    response = conn.post do |p|
      p.headers['app_key'] = "BKCFLWH22GnWSjtMs"
      p.params[:location] = 80202
    end
    # faraday[:headers] = :app_key => "BKCFLWH22GnWSjtMs"
    # response = conn.post #, {:app_key => "BKCFLWH22GnWSjtMs"}

    # key = BKCFLWH22GnWSjtMs


  end
end
