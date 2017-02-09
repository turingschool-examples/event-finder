class EventService
  def self.find_by_zip(zipcode)
    # link to docs http://api.eventful.com/docs/events/search
    # refactor the faraday.get and params
    # I think the March piece should really be Next+Month, get it working then try it out
    response = Faraday.get("http://api.eventful.com/rest/events/search?l=#{zipcode}&t=March+2017&app_key=#{ENV['APP_KEY']}")
    hash = Hash.from_xml(response.body.gsub("\n", ""))
    symbolized_hash = hash.symbolize_keys
    events = symbolized_hash[:search]["events"]["event"]
  end
end
