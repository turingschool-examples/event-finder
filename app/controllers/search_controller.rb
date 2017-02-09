class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    response = Faraday.get "http://api.eventful.com/rest/events/search?app_key=8gWGVrJnPdvtqFrq&location=#{zip_code}&sort_order=popularity"
    # parsed = JSON.parse(response.body)
    binding.pry
  end
end
