module Adapters
  class RedditConnection
    include HTTParty
    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def get_fact
      self.class.get("https://www.reddit.com/r/funfacts/random.json")
    end
  end
end