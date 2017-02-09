class EventService
  def self.find_by_zip(zipcode)
    # link to docs http://api.eventful.com/docs/events/search
    # refactor the faraday.get and params
    # I think the March piece should really be Next+Month, get it working then try it out
    response = Faraday.get("http://api.eventful.com/rest/events/search?l=#{zipcode}&app_key=#{ENV['APP_KEY']}")
    binding.pry
    JSON.parse(response.body, symbolize_names: true)[:events]

  end
end
