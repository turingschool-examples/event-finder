class EventService
  def self.conn
    response = Faraday.new(url: 'http://api.eventful.com/json/events/search') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.find_all_by_zip(zip)
    response = conn.get do |req|
      req.params['app_key']    = ENV['event_finder_api_key']
      req.params['location']   = zip
      req.params['date']       = 'March'
      req.params['sort_order'] = 'popularity'
      req.params['page_size'] =   16
    end

    JSON.parse(response.body, symbolize_names: true)[:events][:event]
  end
end