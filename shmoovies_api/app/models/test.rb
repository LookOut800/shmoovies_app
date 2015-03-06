require 'themoviedb'
require 'dotenv'
Dotenv.load
# file.open('.env', 'r') do |file|

# end

Tmdb::Api.key(ENV['TMDBKEY'])

@search = Tmdb::Search.new
@search.resource('movie') # determines type of resource
@search.query('pineapple express') # the query to search against
hi = @search.fetch

movie = Movie.first

movie.title = hi.first['title']
movie.release_date =  hi.first['release_date']
puts hi.first['vote_average']
puts hi.first['poster_path']
movie.mpaa_rating = hi.first['adult']
puts movie

