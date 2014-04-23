
module TMDB
  class Find
    include HTTParty

    base_uri 'http://api.themoviedb.org'

    # http://docs.themoviedb.apiary.io/#get-%2F3%2Fsearch%2Fmovie


    # http://docs.themoviedb.apiary.io/#get-%2F3%2Fsearch%2Ftv
    def tv_search(options = {})
      options.merge!(api_key: TMDB::API.api_key)
      self.class.get("/3/search/tv", query: options)['results']

      options.merge!(api_key: self.api_key)
      results = TVDB::API.get("/3/tv", query: options)
      tv_shows = []
      results.each do |result|
        tv_shows.push(Mash.new(result))
      end
    end

    # http://docs.themoviedb.apiary.io/#get-%2F3%2Ftv%2F%7Bid%7D
    def tv(tv_id)
      options = { api_key: TMDB::API.api_key }
      results = TVDB::API.get("/3/tv/#{tv_id}", query: options)
      tv_shows = []
      results.each do |result|
        tv_shows.push(Mash.new(result))
      end
    end

  end
end
