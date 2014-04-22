require 'httparty'
require 'ostruct' # Part of Standard Library
require 'hashie'

Dir[File.dirname(__FILE__) + '/tmdb/*.rb'].each do |file|
  require file
end