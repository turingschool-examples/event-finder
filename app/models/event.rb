class Event
  DESCRIPTION_CUT = 140

  def initialize(raw_event_details)
    @_name = raw_event_details["title"]
    @_date_time = raw_event_details["start_time"]
    @_description = raw_event_details["description"]
    @_venue_name = raw_event_details["venue_name"]
    @_venue_url = raw_event_details["venue_url"]
    @_venue_address = raw_event_details["venue_address"]
  end

  def name
    @_name
  end

  def date_time
    @_date_time
  end

  def description
    @_description
  end

  def venue_name
    @_venue_name
  end

  def venue_address
    @_venue_address
  end

  def venue_url
    @_venue_url
  end

  def description_limit
    DESCRIPTION_CUT
  end

end