require "pry"
require "time"

class Movie
  attr_accessor :genre, :title, :start_time

  def initialize(details)
    @title = details[:title]
    @genre = details[:genre]
    @start_time = Time.parse(details[:start_time])
  end

  def showing_after?(time)
    Time.parse(time) <= start_time
  end

  def showing_between?(choice_one, choice_two)
    start_time <= Time.parse(choice_two) && start_time >= Time.parse(choice_one)
  end

  def comedy?
    genre.downcase == "comedy"
  end
end

movies_array = [{title: "The Princess Bride", genre: "Comedy", start_time: "7:00PM"},
{title: "Troll 2", genre: "Horror", start_time: "7:30PM"},
{title: "Pet Cemetery", genre: "Horror", start_time: "8:15PM"},
{title: "Flight of the Navigator", genre: "Adventure", start_time: "8:17PM"},
{title: "Teen Witch", genre: "Comedy", start_time: "8:20PM"},
{title: "The Goonies", genre: "Comedy", start_time: "8:30PM"},
{title: "Better Off Dead", genre: "Comedy", start_time: "8:45PM"},
{title: "Weekend at Bernies", genre: "Comedy", start_time: "9:00PM"},
{title: "The Wizard", genre: "Adventure", start_time: "9:10PM"}]

movies = []
movies_array.each do |movie|
  movies << Movie.new(movie)
end

movies.each do |movie|
  puts "#{movie.title}:\n Genre: #{movie.genre}\n Start Time: #{movie.start_time}"
  puts "Is the movie a comedy: #{movie.comedy?}\nIs it showing after 9:00PM: #{movie.showing_after?("9:00PM")}"
  puts "is the movie showing between 8PM and 9PM: #{movie.showing_between?("8:00PM", "9:00PM")}"
  puts "\n \n "
end
