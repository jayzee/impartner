module Adapters
  class RedditConnection
    include HTTParty
    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def get_fact
      begin
      self.class.get("https://www.reddit.com/r/funfacts/random.json")
      rescue  => e
          alert('reddit fact not loading')
      end
    end
  end
end
