module Adapters
  class FactoidClient

    def self.connection
      @connection ||= Adapters::RedditConnection.new()
    end

    def self.grab_fact
      # 1. Has to hit my api
      data = connection.get_fact
      # 2. convert the hash, into pretty objects
      listing= data[0]["data"]["children"][0]["data"]
      if listing["over_18"] != true
        return listing
      else
        self.grab_fact
      end
    end

  end
end