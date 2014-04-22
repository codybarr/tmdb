require_relative '../test_helper'

#TODO: rewrite tests using Minitest best practices ()

describe TMDB::Search do
  # Create a 'test/api_key' file and paste in your API key to run the tests
  # TODO: Work in 'gem webmock' for offline testing, review: http://code.tutsplus.com/articles/writing-an-api-wrapper-in-ruby-with-tdd--net-23875
  API_KEY = File.open('test/api_key').read

  let(:search) { TMDB::Search.new }

  before do
    TMDB::Config.api_key = API_KEY
  end

  # TMDB::Search#movie_search(query, page)
  describe ".movie_search" do
    it "should return correct results" do
      movies = search.movie_search(query: 'matrix')

      movies.first.title.must_equal "The Matrix"
    end
  end

  # TMDB::Search#movie(movie_id)

  describe ".movie" do
    it "should return the correct movie" do
      movie = search.movie('550')

      movie.title.must_equal "Fight Club"
    end

    it "should allow iterating over results with multiple values" do
      movie = search.movie('550')

      movie.genres.first.name.must_equal "Action"
      movie.genres.last.name.must_equal "Thriller"
    end

  end
end
