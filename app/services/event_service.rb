class EventService
  def self.conn
    response = Faraday.new(url: 'http://api.eventful.com/json/events/search') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.find_all_by_zip(zip)
    response = conn.get do |req|
      req.params['app_key']  = ENV['event_finder_api_key']
      req.params['location'] = zip
    end

    final = JSON.parse(response.body)['events']['event']
    binding.pry
  end
end