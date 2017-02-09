class Event
  def self.find_all_by_zip(zip)
    EventService.find_all_by_zip(zip).map { |raw_event| new(raw_event) }
  end
end