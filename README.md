# tmdb

[![Gem Version](https://badge.fury.io/rb/tmdb.svg)](http://badge.fury.io/rb/tmdb)

Simple ruby wrapper for _The MovieDB_ based on HTTParty

## Installation

**tmdb** is hosted at rubygems.org

`gem install tmdb`

## Compatability

I wrote this gem while using ruby 2.0.0, I haven't tested compatability with other versions.

## Examples

```ruby
require 'tmdb'

# Always run Config's api_key class method first to set the api key class variable
TMDB::API.api_key = "YOUR_API_KEY"

# Get the configuration data
TMDB::API.config
# => (see http://docs.themoviedb.apiary.io/#configuration)

# To search for movies based on a query (returns an array of Hashie::Mash objects)
movies = TMDB::Movie.search(query: 'the matrix')
# => <Hashie::Mash "adult"=>false,
#  "backdrop_path"=>"/7u3pxc0K1wx32IleAkLv78MKgrw.jpg",
#  "id"=>603,
#  "original_title"=>"The Matrix",
#  "release_date"=>"1999-03-30",
#  "poster_path"=>"/gynBNzwyaHKtXqlEKKLioNkjKgN.jpg",
#  "popularity"=>10.3021669763687,
#  "title"=>"The Matrix",
#  "vote_average"=>7.4,
#  "vote_count"=>3674> ...

# Then you can pull the data from the results, ie.
movies.first.title
# => "The Matrix"

# To pull all the information for a particular movie, run an id search:
movie = TMDB::Movie.id(550)
# => <Hashie::Mash "adult"=>false,
 "backdrop_path"=>"/hNFMawyNDWZKKHU4GYCBz1krsRM.jpg",
 "belongs_to_collection"=>nil,
 "budget"=>63000000,
 "genres"=>
  [{"id"=>28, "name"=>"Action"},
   {"id"=>18, "name"=>"Drama"},
   {"id"=>53, "name"=>"Thriller"}],
 "homepage"=>"",
 "id"=>550,
 "imdb_id"=>"tt0137523",
 "original_title"=>"Fight Club",
 "overview"=>
  "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
 "popularity"=>10.0690866732421,
 "poster_path"=>"/hpt3aa5i0TrSAnEdl3VJrRrje8C.jpg",
 "production_companies"=>
  [{"name"=>"20th Century Fox", "id"=>25},
   {"name"=>"Fox 2000 Pictures", "id"=>711},
   {"name"=>"Regency Enterprises", "id"=>508}],
 "production_countries"=>
  [{"iso_3166_1"=>"DE", "name"=>"Germany"},
   {"iso_3166_1"=>"US", "name"=>"United States of America"}],
 "release_date"=>"1999-10-14",
 "revenue"=>100853753,
 "runtime"=>139,
 "spoken_languages"=>[{"iso_639_1"=>"en", "name"=>"English"}],
 "status"=>"Released",
 "tagline"=>
  "How much can you know about yourself if you've never been in a fight?",
 "title"=>"Fight Club",
 "vote_average"=>7.6,
 "vote_count"=>2838>
```

## Usage

_TODO_

_tmdb is a work in progress and isn't really usable at the moment.  It's my first gem so I'm going to take some time working on it_

## Testing

Make sure to create an 'api_key' file at 'test/api_key' in order to run the tests.  I'll work offline testing into the gem later.

## Copyright

Copyright &copy; 2014 Cody Barr. See LICENSE.md for
further details.

