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

# To search for movies based on a query
movies = TMDB::Movie.search(query: 'the matrix')
# => 
```

## Usage

_TODO_

_tmdb is a work in progress and isn't really usable at the moment.  It's my first gem so I'm going to take some time working on it_

## Testing

Make sure to create an 'api_key' file at 'test/api_key' in order to run the tests.  I'll work offline testing into the gem later.

## Copyright

Copyright &copy; 2014 Cody Barr. See LICENSE.md for
further details.

