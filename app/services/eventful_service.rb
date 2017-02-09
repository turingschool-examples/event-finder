class EventfulService
  def self.search_by(zip, month)
    raw_response = Faraday.get "http://api.eventful.com/json/events/search?where=#{zip}&app_key=#{ENV["eventful_app_key"]}&when=#{from_number_to_name(month)}&sort_order=popularity&page_size=16"
    response = JSON.parse(raw_response.body, symbolize_names: true)[:events][:event]
  end

  def self.from_number_to_name(month)
    (Time.now + ((month.to_i)-2).month).strftime("%B")
  end
end