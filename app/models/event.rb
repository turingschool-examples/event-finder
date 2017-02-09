class Event
  attr_reader :title,
              :date,
              :time,
              :description,
              :venue,
              :venue_address,
              :venue_url

  def initialize(params)
    @title = params["title"]
    @date = Date.parse(params["start_time"])
    @time = Time.parse(params["start_time"])
    @description = params["description"].to_s[0..139] + "..."
    @venue = params["venue_name"]
    @venue_address = params["venue_address"]
    @venue_url = params["venue_url"]
  end
end
