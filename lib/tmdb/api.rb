# config.rb

module TMDB
  class API
    include HTTParty

    @@api_key = ''

    base_uri 'http://api.themoviedb.org'

    def self.api_key
      @@api_key
    end

    def self.api_key=(key)
      @@api_key = key
    end

    def self.config
      options = { api_key: self.api_key }
      response = TMDB::API.get("/3/configuration", query: options).parsed_response
      Hashie::Mash.new(response)
      # configuration['images']['base_url'] => "http://image.tmdb.org/t/p/" 
    end

  end
end
