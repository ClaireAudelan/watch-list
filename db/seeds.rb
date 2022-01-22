# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts movies["results"]

puts "Cleaning up database"
Movie.destroy_all
puts "Database is clean"

puts "Creating movies"
movies["results"].each do |result|
  movie = Movie.create(
    title: result["title"],
    overview: result["overview"],
    poster_url: result["poster_path"],
    rating: result["vote_average"]
  )
  puts "Movie #{movie.id} is created"
end

puts "Done!"
