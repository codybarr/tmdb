# tv.rb

module TMDB
  class TV

    def self.search(options = {})
      options.merge!(api_key: TMDB::API.api_key)
      results = TMDB::API.get("/3/search/tv", query: options)['results']
      tv_shows = []
      results.each do |result|
        tv_shows.push(Hashie::Mash.new(result))
      end
      return tv_shows
    end

    def self.id(tv_id)
      options = { api_key: TMDB::API.api_key }
      Hashie::Mash.new(TMDB::API.get("/3/tv/#{tv_id}", query: options))
    end

    # TODO: top_rated, popular
  end

end