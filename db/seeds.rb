# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroy old data'

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

require 'faker'
require "open-uri"
# require 'pry-byebug'


50.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: Faker::Internet.url,
    rating: (5..10).to_a.sample
  )
  if movie.valid?
    movie.save!
  end
end

10.times do
  list = List.new(
    name: Faker::Music.genre
  )
  if list.valid?
    file = URI.open('https://source.unsplash.com/1600x900/?movies')
    list.photo.attach(io: file, filename: 'images.png', content_type: 'image/png')
    list.save!
  end

  (1..3).to_a.sample.times do
    bookmark = Bookmark.new(
      comment: Faker::TvShows::Friends.quote,
      list: List.last,
      movie: Movie.all.sample
    )
    if bookmark.valid?
      bookmark.save!
    end
  end
end
