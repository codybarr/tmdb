
module TMDB
  class Search
    include HTTParty

    base_uri 'http://api.themoviedb.org'

    # http://docs.themoviedb.apiary.io/#get-%2F3%2Fsearch%2Fmovie
    def movie_search(options = {})
      # Accepted parameters:
      # :page, :include_adult (true / false) , :year
      options.merge!(api_key: TMDB::Config.api_key)
      results = self.class.get("/3/search/movie", query: options)['results']
      movies = []
      results.each do |result|
        movies.push(Hashie::Mash.new(result))
      end
      return movies
    end

    def movie(movie_id)
      options = { api_key: TMDB::Config.api_key }
      Hashie::Mash.new(self.class.get("/3/movie/#{movie_id}", query: options))
      # movie.title = "Fight Club"
    end

    # http://docs.themoviedb.apiary.io/#get-%2F3%2Fsearch%2Ftv
    def tv_search(options = {})
      options.merge!(api_key: TMDB::Config.api_key)
      self.class.get("/3/search/tv", query: options)['results']

      options.merge!(api_key: self.api_key)
      results = self.class.get("/3/tv", query: options)
      tv_shows = []
      results.each do |result|
        tv_shows.push(Mash.new(result))
      end
    end

    # http://docs.themoviedb.apiary.io/#get-%2F3%2Ftv%2F%7Bid%7D
    def tv(tv_id)
      options = { api_key: TMDB::Config.api_key }
      results = self.class.get("/3/tv/#{tv_id}", query: options)
      tv_shows = []
      results.each do |result|
        tv_shows.push(Mash.new(result))
      end
    end

  end
end
