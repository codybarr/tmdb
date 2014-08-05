# TODO: See about making this a deepopenstruct: https://github.com/aarongough/deepopenstruct
# TODO: Review http://ruby.learncodethehardway.org/book/ex44.html first, figure out if we ant to use inheritance or composition

module TMDB
  class Movie < Hashie::Mash

    def poster(size='original')
      # Poster Sizes: ["w92", "w154", "w185", "w342", "w500", "w780", "original"]
      # Find latest list at TMDB::API.config.poster_sizes
      config = TMDB::API.config
      if self.poster_path
        config.images.base_url + size + self.poster_path
      else
        ''
      end
    end

    def backdrop(size='original')
      # Backdrop Sizes: ["w300", "w780", "w1280", "original"]
      # Find latest list at TMDB::API.config.backdrop_sizes
      config = TMDB::API.config
      if self.backdrop_path
        config.images.base_url + size + self.backdrop_path
      else
        ''
      end
    end

    def self.search(title, options = {})
      # Accepted parameters:
      # :page, :include_adult (true / false), :year
      options.merge!(api_key: TMDB::API.api_key, 
                     query: title)
      results = TMDB::API.get("/3/search/movie", query: options)['results']
      movies = []
      results.each do |result|
        movies.push(TMDB::Movie.new(result))
      end
      return movies
    end

    # language (ISO_639_1: 'en')
    # country (ISO_3166_1: 'US')
    def self.advanced_search(options = {})
      # US-snobbish
      options.merge!(api_key: TMDB::API.api_key,
                     language: 'en',
                     certification_country: 'US')
      results = TMDB::API.get("/3/discover/movie", query: options)['results']
      movies = []
      results.each do |result|
        movies.push(TMDB::Movie.new(result))
      end
      return movies
    end

    def self.id(movie_id)
      options = { api_key: TMDB::API.api_key }
      return TMDB::Movie.new(TMDB::API.get("/3/movie/#{movie_id}", query: options))
    end

    def self.imdb_id(imdb_id)
      options = { api_key: TMDB::API.api_key,
                  external_source: 'imdb_id'}
      result = TMDB::API.get("/3/find/#{imdb_id}", query: options)['movie_results'].first
      return TMDB::Movie.new(result)
    end

    def self.popular
      options = { api_key: TMDB::API.api_key }
      results = TMDB::API.get("/3/movie/popular", query: options)['results']
      movies = []
      results.each do |result|
        movies.push(TMDB::Movie.new(result))
      end     
      return movies
    end
  end
end