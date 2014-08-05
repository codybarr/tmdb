# tmdb

[![Gem Version](https://badge.fury.io/rb/tmdb.svg)](http://badge.fury.io/rb/tmdb)

Simple ruby wrapper for _The MovieDB_ based on HTTParty (starting to transform into more of an abstraction than a wrapper: http://wynnnetherland.com/journal/what-makes-a-good-api-wrapper)

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
    * ::search
    * ::advanced_search
    * ::id
    * ::imdb_id
    * ::popular
    * #poster(size)
    * #backdrop(size)
* [TV](#tv)
    * ::search
    * ::id

Todo: 
* Movie
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

#### Class Methods

##### ::search

```ruby
# To search for movies by title (returns an array of TMDB:Movie objects)
movies = TMDB::Movie.search('the matrix')
# => <TMDB::Movie adult=false 
  backdrop_path="/yQeEMjnBOIAtFqIuEphyesH0a6y.jpg" 
  id=603 
  original_title="The Matrix"
  popularity=5.06402605254135
  poster_path="/gynBNzwyaHKtXqlEKKLioNkjKgN.jpg"
  release_date="1999-03-30"
  title="The Matrix"
  vote_average=7.5
  vote_count=3773>

# Then you can pull the data from the results, ie.
movies.first.title
# => "The Matrix"
```

##### ::advanced_search

```ruby
# Use .advanced_search to find by various parameters (ie. release date)
movies = TMDB::Movie.advanced_search('release_date.gte' => '2014-01-01',
                            'release_date.lte' => (Time.now.strftime("%Y-%m-%d")),
                            primary_release_year: 2014)
# => Array of <TMDB::Movie>s
```

##### ::id

```ruby
# To pull all the information for a particular movie, run an id search:
movie = TMDB::Movie.id(603)
# => <TMDB::Movie adult=false 
  backdrop_path="/yQeEMjnBOIAtFqIuEphyesH0a6y.jpg"
  ...
  budget=63000000 
  genres=>
    [{ id=28 name="Action",
       id=12 name="Adventure",
       id=878 name="Science Fiction",
       id=53 name="Thriller" {}]
  homepage="http://www.warnerbros.com/movies/home-entertainment/the-matrix/37313ac7-9229-474d-a423-44b7a6bc1a54.html"
  ...
  id=603
  imdb_id="tt0133093"
 ```

##### ::imdb_id

```ruby
# To search by IMDB ID use Movie::imdb_id:
movie = TMDB::Movie.imdb_id('tt0133093')
# => <TMDB::Movie yada yada>

##### ::popular

```ruby
# Use .popular to final recent popular movies (according to The Movie Database)
movies = TMDB::Movie.popular
# => Array of <TMDB:Movie>s
```

#### Instance Methods

##### #poster

```ruby
# Use .poster to return a particular TMDB::Movie's poster path, default is 'original'
# Poster Sizes: ["w92", "w154", "w185", "w342", "w500", "w780", "original"]
TMDB::Movie.id(550).poster
# => http://image.tmdb.org/t/p/original/2lECpi35Hnbpa4y46JX0aY3AWTy.jpg
```

##### #backdrop

```ruby
# Same as #poster but for backdrops
# Backdrop Sizes: ["w300", "w780", "w1280", "original"]
TMDB::Movie.id(550).backdrop('w300')
# => http://image.tmdb.org/t/p/w300/hNFMawyNDWZKKHU4GYCBz1krsRM.jpg
```

### TV

#### Class Methods

##### ::search

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

## More Examples

You can look through the tests for more examples

## Usage

_TODO_

_tmdb is a work in progress and isn't really usable at the moment.  It's my first gem so I'm going to take some time working on it_

## Testing

Make sure to create an 'api_key' file at 'test/api_key' in order to run the tests.  I'll work offline testing into the gem later.

## Copyright

Copyright &copy; 2014 Cody Barr. See LICENSE.md for
further details.

