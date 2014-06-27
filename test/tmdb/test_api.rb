# test_api.rb

require_relative '../test_helper'

describe TMDB::API do
  TMDB::API.api_key = API_KEY

  # TMDB::API::search(query, page, etc.)
  describe ".config" do
    it "should return the configuration data" do
      TMDB::API.config.must_be_instance_of Hashie::Mash
    end
  end

  describe ".genres" do
    it "should return an array of English Genres" do
      TMDB::API.genres.values.first.must_equal "Action"
    end
  end
end
