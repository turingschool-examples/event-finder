class EventfulEvent
  attr_reader :title,
              :date,
              :start_time,
              :description,
              :venue_name,
              :venue_url,
              :venue_address

  def initialize(data = {})
    @title = data["title"]
    @date = DateTime.parse(data["start_time"]).to_date
    @time = strftime(DateTime.parse(data["start_time"]), "%I:%M%p")
    @description = data["description"]
    @venue_name = data["venue_name"]
    @venue_url = data["venue_url"]
    @venue_address = data["venue_address"]
  end

end
