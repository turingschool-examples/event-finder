class FindEvents

  def self.find_by_zipcode(zipcode)
    EventsService.find_by_zipcode(zipcode)
  end

end
