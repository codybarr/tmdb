require_relative '../test_helper'

# TODO: rewrite tests using Minitest best practices

describe TMDB::Movie do
  # Create a 'test/api_key' file and paste in your API key to run the tests
  # TODO: Work in 'gem webmock' for offline testing, review: http://code.tutsplus.com/articles/writing-an-api-wrapper-in-ruby-with-tdd--net-23875
  TMDB::API.api_key = API_KEY

  # TMDB::Movie::search(query, page, etc.)
  describe ".search" do
    it "should return correct results" do
      movies = TMDB::Movie.search(query: 'the matrix')

      movies.first.title.must_equal "The Matrix"
    end
  end

  # TMDB::Movie::id(movie_id)

  describe ".id" do

    let (:movie) { TMDB::Movie.id(550) }

    it "should return the correct movie" do
      movie.title.must_equal "Fight Club"
    end

    it "should allow iterating over results with multiple values" do
      movie.genres.first.name.must_equal "Action"
      movie.genres.last.name.must_equal "Thriller"
    end

  end
end
