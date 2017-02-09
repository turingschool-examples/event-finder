class ResultsPresenter
  attr_reader :events
  
  def initialize(raw_events)
    @events = filter_attributes(raw_events['events']['event'])
  end

  def filter_attributes(raw_events)
    raw_events.map do |event|
      {'name' = event['title'],
      'date' = event['start_time'],
      'description' = event['description']
      'venue_name' = event['venue_name'],
      'venue_url' = event['venue_url'],
      'venue_address' = event['venue_address']}
    end
    byebug
  end
end
