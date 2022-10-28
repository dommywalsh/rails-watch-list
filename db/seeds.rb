require "json"
require "open-uri"

puts 'Clearing DB'
Bookmark.destroy_all
Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

relevant_infos = data["results"]

relevant_infos.each do |info|
  poster_url = "https://image.tmdb.org/t/p/original/#{info["poster_path"]}"
  file = URI.open(poster_url)
  movie = Movie.new(title: info["original_title"], overview: info["overview"], poster_url: poster_url, rating: info["popularity"])
  movie.photo.attach(io: file, filename: "#{info["original_title"].gsub(" ", "-")}.png", content_type: "image/png")
  movie.save
end

puts 'Finished!'
puts "Made #{Movie.count} movies"
