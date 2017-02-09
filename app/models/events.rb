class Events
  def initialize(json_attrs = {})
    @url         = json_attrs[:url]
    @title       = json_attrs[:title]
    @description = json_attrs[:description]
  end

  def self.within_zip(zip)
    EventfulService.within_zip(zip).map {|event| new(event)}
  end
end
