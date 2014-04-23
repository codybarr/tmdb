require 'httparty'
require 'hashie'

Dir[File.dirname(__FILE__) + '/tmdb/*.rb'].each do |file|
  require file
end