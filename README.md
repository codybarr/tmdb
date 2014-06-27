# tmdb

[![Gem Version](https://badge.fury.io/rb/tmdb.svg)](http://badge.fury.io/rb/tmdb)

Simple ruby wrapper for _The MovieDB_ based on HTTParty

## Installation

**tmdb** is hosted at rubygems.org

`gem install tmdb`

## Compatability

I wrote this gem while using ruby 2.0.0, I haven't tested compatability with other versions.

## API Coverage

Current available:
* [API](#api)
    * ::api_key=
    * ::config
    * ::genres(source)
* [Movie](#movies)
    * ::title_search
    * ::search
    * ::id
* [TV](#tv)
    * ::search
    * ::id

Todo: 
* Movie
    * ::popular
    * ::top_rated
* TV
    * ::popular
    * ::top_rated
* People/Person
    * ::id
    * ::search

## Examples

### API
```ruby
require 'tmdb'

# Always run API's api_key class method first to set the api key class variable
TMDB::API.api_key = "YOUR_API_KEY"

# Get the configuration data
TMDB::API.config
# => (see http://docs.themoviedb.apiary.io/#configuration)

# Get a hash of genres (for Movies or TV)
TMDB::API.genres
# {28=>"Action", 12=>"Adventure", etc..}
# (Default is for movies)

TMDB::API.genres("tv")
# (for TV)
```

### Movies

```ruby
# To search for movies based on a query (returns an array of Hashie::Mash objects)
# Use any of the parameters listed here: http://docs.themoviedb.apiary.io/#get-%2F3%2Fsearch%2Fmovie
movies = TMDB::Movie.title_search(query: 'the matrix')
# => <Hashie::Mash "adult"=>false,
  "backdrop_path"=>"/7u3pxc0K1wx32IleAkLv78MKgrw.jpg",
  "id"=>603,
  "original_title"=>"The Matrix",
  "release_date"=>"1999-03-30",
  "poster_path"=>"/gynBNzwyaHKtXqlEKKLioNkjKgN.jpg",
  "popularity"=>10.3021669763687,
  "title"=>"The Matrix",
  "vote_average"=>7.4,
  "vote_count"=>3674> ...

# Then you can pull the data from the results, ie.
movies.first.title
# => "The Matrix"

# Use .search for to find by various parameters (ie. release date)

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
 "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."...>
```

### TV

```ruby
# Similar to Movies
TMDB::TV.search(query: 'walking dead')
# => <Hashie::Mash {"backdrop_path"=>"/nGzg3mn3C6fYVE0SvXHmY2XX4P2.jpg",
 "created_by"=>
  [{"id"=>4027,
    "name"=>"Frank Darabont",
    "profile_path"=>"/fLKzpG3J88lPr8y8dCJbcFKN6iX.jpg"}],
 "episode_run_time"=>[60, 45],
 "first_air_date"=>"2010-10-31",
 "genres"=>
  [{"id"=>18, "name"=>"Drama"},
   {"id"=>27, "name"=>"Horror"},
   {"id"=>53, "name"=>"Thriller"}],
 "homepage"=>"http://www.amctv.com/shows/the-walking-dead/",
 "id"=>1402,
 "in_production"=>true,
 "languages"=>["en"],
 "last_air_date"=>"2014-03-30",
 "name"=>"The Walking Dead" ...>
```

### More Examples

You can look through the tests for more examples

## Usage

_TODO_

_tmdb is a work in progress and isn't really usable at the moment.  It's my first gem so I'm going to take some time working on it_

## Testing

Make sure to create an 'api_key' file at 'test/api_key' in order to run the tests.  I'll work offline testing into the gem later.

## Copyright

Copyright &copy; 2014 Cody Barr. See LICENSE.md for
further details.

