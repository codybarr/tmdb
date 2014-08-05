require_relative '../test_helper'

# TODO: rewrite tests using Minitest best practices

describe TMDB::Movie do
  # Create a 'test/api_key' file and paste in your API key to run the tests
  # TODO: Work in 'gem webmock' for offline testing, review: http://code.tutsplus.com/articles/writing-an-api-wrapper-in-ruby-with-tdd--net-23875
  TMDB::API.api_key = API_KEY

  # TMDB::Movie::title_search(query, page, etc.)
  describe "::search" do
    it "should return correct results" do
      movies = TMDB::Movie.search('the matrix')

      movies.first.title.must_equal "The Matrix"
    end
  end

  # TMDB::Movie::search(release_date.gte, page, etc.)
  describe "::advanced_search('...')" do
    
    it "should return recent results" do
      skip("Specifying dates don't always work")
      movies = TMDB::Movie.advanced_search('release_date.gte' => '2014-01-01',
                                  'release_date.lte' => (Time.now.strftime("%Y-%m-%d")),
                                  primary_release_year: 2014)

      # Some of these might fail because release_date.lte/gte search all available release dates
      movies.each do |movie|
        movie[:release_date].must_be :<, Time.now.to_s
        movie[:release_date].must_be :>, '2014-01-01'
      end
    end
  end

  # TMDB::Movie::id(movie_id)
  describe "::id" do

    let (:movie) { TMDB::Movie.id(603) }

    it "should return the correct movie" do
      movie.title.must_equal "The Matrix"
    end

    it "should allow iterating over results with multiple values" do
      movie.genres.first.name.must_equal "Action"
      movie.genres.last.name.must_equal "Thriller"
    end
  end

  #TMDB::Movie::imdb_id(imdb_id)
  describe "::imdb_id" do
    let (:movie) { TMDB::Movie.imdb_id('tt0133093') }

    it "should return the correct movie" do
      movie.title.must_equal "The Matrix"
    end
  end

  # TMDB::Movie::popular
  describe "::popular" do
    it "should return a list of popular results" do
      movies = TMDB::Movie.popular
      movies.must_be_instance_of Array
    end
  end

  # TMDB::Movie#poster
  describe "#poster" do 
    let (:movie) { TMDB::Movie.id(550) }

    it "should return the poster URL" do
      movie.poster.wont_be_nil
    end
  end

    # TMDB::Movie#backdrop
  describe "#backdrop" do 
    let (:movie) { TMDB::Movie.id(550) }

    it "should return the poster URL" do
      movie.backdrop('w300').wont_be_nil
    end
  end

end
