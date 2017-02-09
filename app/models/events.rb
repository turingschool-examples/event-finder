class Events
  def initialize(json_attrs = {})
    @url         = json_attrs[:url]
    @title       = json_attrs[:title]
    @description = json_attrs[:description]
  end
