# test_api.rb

require_relative '../test_helper'

describe TMDB::API do
  TMDB::API.api_key = API_KEY

  # TMDB::API::search(query, page, etc.)
  describe ".config" do
    it "should return the configuration data" do
      TMDB::API.config.must_be_instance_of OpenStruct
    end
  end
end
