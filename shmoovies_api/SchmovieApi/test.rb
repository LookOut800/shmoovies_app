require 'themoviedb'
require 'dotenv'
Dotenv.load
# file.open('.env', 'r') do |file|

# end

Tmdb::Api.key(ENV['TMDBKEY'])

puts Tmdb::Movie.find("batman")
puts Tmdb::Movie.detail(550)
