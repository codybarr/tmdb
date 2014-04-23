# TODO: See about making this a deepopenstruct: https://github.com/aarongough/deepopenstruct
# TODO: Review http://ruby.learncodethehardway.org/book/ex44.html first, figure out if we ant to use inheritance or composition

module TMDB
  class Movie

      def self.search(options = {})
        # Accepted parameters:
        # :page, :include_adult (true / false), :year
        options.merge!(api_key: TMDB::API.api_key)
        results = TMDB::API.get("/3/search/movie", query: options)['results']
        movies = []
        results.each do |result|
          movies.push(Hashie::Mash.new(result))
        end
        return movies
      end

      def self.id(movie_id)
        options = { api_key: TMDB::API.api_key }
        Hashie::Mash.new(TMDB::API.get("/3/movie/#{movie_id}", query: options))
        # movie.title = "Fight Club"
      end
  end
end