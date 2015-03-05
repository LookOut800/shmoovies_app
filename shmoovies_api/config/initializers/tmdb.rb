require 'themoviedb'
require 'dotenv'
Dotenv.load

Tmdb::Api.key(ENV['TMDBKEY'])
