class EventService
  def self.find_by_zip(zipcode)
    # refactor the faraday.get and params
    # I think the March piece should really be Next+Month, get it working then try it out
    response = Faraday.get("http://eventful.com/events?l=#{zipcode}&t=March+2017")
    JSON.parse(response.body, symbolize_names: true)[:events]
  end
end
