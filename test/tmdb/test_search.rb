require_relative '../test_helper'

describe "TMDB::Search" do
  # Create a 'test/api_key' file and paste in your API key to run the tests
  # TODO: Work in 'gem webmock' for offline testing, review: http://code.tutsplus.com/articles/writing-an-api-wrapper-in-ruby-with-tdd--net-23875
  API_KEY = File.open('test/api_key').read

  let(:search) { TMDB::Search.new(API_KEY) }

  # TMDB::Search#movie_search(query, page)

  it "tmdb.movie_search('matrix') should return a page of matrix results" do 
    puts search
    movies = search.movie_search(query: 'matrix')
    movies.first['title'].must_equal "The Matrix"
  end

  # TMDB::Search#movie(movie_id)

  it "tmdb.movie('550') should return the movie Fight Club" do
    movie = search.movie('550')
    movie['title'].must_equal "Fight Club"
  end

end
