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
Student.all.clear
Teacher.all.clear

admin = User.create(email: "admin@admin.com", name: "Admin")
admin.password = "password"
admin.password_confirmation = "password"
admin.save

teacher = Teacher.create(user_id: 1)
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

arr_track = [algebra, thai, ukulele, english, ruby, train]

arr_track.each do |track| 
  track.teacher = teacher
  track.save
end 

var = algebra.lessons.create(title: "Variables", duration: "20 minutes", order_id: 1)
exp = algebra.lessons.create(title: "Expressions", duration: "60 minutes", order_id: 2)
slope = algebra.lessons.create(title: "Slope", duration: "10 minutes", order_id: 3)

#Resources: video, image, podcast, article, post
var.resources.create(title:"Amazing Video", description: "This video will teach you stuff!", content: "https://www.youtube.com/watch?v=Cg8sAM8E9ko", type_of: "Video")
var.resources.create(title:"Super awesome post", description: "This post will inform you about stuff.", content: "http://www.mathplanet.com/education/algebra-1/discovering-expressions,-equations-and-functions/expressions-and-variables", type_of: "Other")
var.resources.create(title:"Coeffiecients", description: "Look at this image so that you know about variables well.", content: "https://www.mathsisfun.com/algebra/images/variable-constant.gif" , type_of: "Image")



var.assessments.create(challenge?: false)

