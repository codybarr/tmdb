# test_tv.rb

require_relative '../test_helper'

describe TMDB::TV do
  TMDB::API.api_key = API_KEY

    describe ".search" do
    it "should return correct results" do
      shows = TMDB::TV.search(query: 'walking dead')

      shows.first.name.must_equal "The Walking Dead"
    end
  end

  describe ".id" do

    let (:show) { TMDB::TV.id(1402) }

    it "should return the correct movie" do
      show.name.must_equal "The Walking Dead"
    end

    it "should allow iterating over results with multiple values" do
      show.genres.first.name.must_equal "Drama"
      show.genres.last.name.must_equal "Thriller"
    end

  end

end