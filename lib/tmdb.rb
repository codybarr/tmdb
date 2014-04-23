require 'httparty'

# TODO: still trying to decided on struct (more abstraction needed), openstruct, deepopenstruct, or Hashie::Mash...
require 'ostruct'
require 'hashie'

Dir[File.dirname(__FILE__) + '/tmdb/*.rb'].each do |file|
  require file
end