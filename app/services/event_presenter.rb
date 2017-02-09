class EventPresenter
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def events_search
    Event.list(zipcode)
  end

end