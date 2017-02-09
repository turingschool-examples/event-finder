class Events

  def self.find_all(zip_code)
    EventService.find_all(zip_code).map do |event|
      new(event)
    end
  end

end