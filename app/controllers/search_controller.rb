class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    response = Faraday.get "http://api.eventful.com/rest/events/search?api_key=8gWGVrJnPdvtqFrq&location=#{zip_code}"
    binding.pry
  end
end
