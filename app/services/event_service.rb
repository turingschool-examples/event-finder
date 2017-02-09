class EventService
  def self.find_by_zip(zipcode)
    # link to docs http://api.eventful.com/docs/events/search
    # refactor the faraday.get and params
    # I think the March piece should really be Next+Month, get it working then try it out
    response = Faraday.get("http://eventful.com/events?q=music&l=San+Diego")
    # response = Faraday.get("http://eventful.com/events?l=#{zipcode}&access_token=vvpwQ7p7zZ5sXgHt")
    binding.pry
    JSON.parse(response.body, symbolize_names: true)[:events]

  end
end
