# config.rb

module TMDB
  class Config
    include HTTParty

    @@api_key = ''

    base_uri 'http://api.themoviedb.org'

    def self.api_key
      @@api_key
    end

    def self.api_key=(key)
      @@api_key = key
    end

    def self.info
      options = { api_key: self.api_key }
      Mash.new(self.class.get("/3/configuration", query: options).parsed_response)
      # configuration['images']['base_url'] => "http://image.tmdb.org/t/p/" 
    end

  end
end
