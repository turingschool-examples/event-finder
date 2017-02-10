class EventfulService
  def search(attrs = {})
    @url = "json/events/search"
    @filter = default_search.merge(attrs)
    get_json(default_search.merge(attrs))[:events][:event]
  end

  def self.search_by_zip(zip)
    new.search({location: zip})
  end

  private
    def get_json(filter)
      JSON.parse(response, symbolize_names: true)
    end

    def url
      @url
    end

    def filter
      @filter
    end

    def response
      conn.get(@url, @filter).body
    end

    def default_search
      {
        app_key: ENV["EVENTFUL_KEY"],
        page_size: "16",
        date: "March",
        sort_order: "popularity"
      }
    end

    def conn
      @conn ||= Faraday.new(:url => 'http://api.eventful.com/')
    end
end
