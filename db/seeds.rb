# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.all.clear
Track.all.clear
Lesson.all.clear

categories = ["STEM", "Health", "Music", "Language", "History", "Art"]

categories.each do |category|
  Category.create(title: category)
end

stem = Category.find_by(title: "STEM")
health = Category.find_by(title: "Health")
music = Category.find_by(title: "Music")
language = Category.find_by(title: "Language")


algebra = stem.tracks.create(name: "Algebra", description: "Learn a lot of algebra!")
thai = health.tracks.create(name: "Thai Food", description: "Make the most amazing pad thai...")
ukulele = music.tracks.create(name: "Ukulele", description: "Be that cool guy at that party.")
english = language.tracks.create(name: "English 101", description: "Where art thou?")
ruby = stem.tracks.create(name: "Intro to Ruby", description: "Get your programming on!")
train = stem.tracks.create(name: "How Trains Work", description: "Because you always wondered..")

algebra.lessons.create(title: "Variables", duration: "20 minutes", order_id: 1)
algebra.lessons.create(title: "Expressions", duration: "60 minutes", order_id: 2)
algebra.lessons.create(title: "Slope", duration: "10 minutes", order_id: 3)