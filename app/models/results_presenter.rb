class ResultsPresenter
  attr_reader :events
  
  def initialize(raw_events)
    @events = filter_attributes(raw_events)
  end

  def filter_attributes(raw_events)
    byebug
    
  end
end
