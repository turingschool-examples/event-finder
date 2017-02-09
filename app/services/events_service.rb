class EventsService

  def self.find_by_zip(zip)
    response = Faraday.get("http://api.eventful.com/json/events/search?location=#{zip}&app_key=g52t5VnTpTfh2pZM")
    JSON.parse(response.body, symbolize_names:true)
    byebug
  end
end

# keys [:last_item, :total_items, :first_item, :page_number, :page_size, :page_items, :search_time, :page_count, :events]
