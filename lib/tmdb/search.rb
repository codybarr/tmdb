
module TMDB
  class Search
    include HTTParty

    attr_accessor :api_key

    base_uri 'http://api.themoviedb.org'

    def initialize(api_key='')
      @api_key = api_key
    end

    def configuration
      options = {api_key: self.api_key}
      self.class.get("/3/configuration", query: options).parsed_response
      # configuration['images']['base_url'] => "http://image.tmdb.org/t/p/" 
    end

    def movie_search(options = {})
      # Accepted parameters:
      # :page, :include_adult, :year
      options.merge!(api_key: self.api_key)
      self.class.get("/3/search/movie", query: options)['results']
    end

    def movie(movie_id)
      options = {api_key: self.api_key}
      self.class.get("/3/movie/#{movie_id}", query: options)
      # movie['title'] = "Fight Club"
    end

    # TODO: tv_search(query, page), tv(id), 

  end
end
