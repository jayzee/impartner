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

user1 = User.create(email: "joeblow@yahoo.com", name: "Joe B")
user1.password = "password1"
user1.password_confirmation = "password1"
user1.save

user2 = User.create(email: "slystone@gmail.com", name: "Sly Stone")
user2.password = "password2"
user2.password_confirmation = "password2"
user2.save

user3 = User.create(email: "bigtaco@gmail.com", name: "Mia Poppers")
user3.password = "password3"
user3.password_confirmation = "password3"
user3.save

user4 = User.create(email: "bzzz4@gmail.com", name: "Mookie Wilson")
user4.password = "password4"
user4.password_confirmation = "password4"
user4.save

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

Student.create(user_id: user1.id)
Student.create(user_id: user2.id)
Student.create(user_id: user3.id)
Student.create(user_id: user4.id)

StudentsTrack.create(track_id: var.id,student_id: user1.id)
StudentsTrack.create(track_id: var.id,student_id: user2.id)
StudentsTrack.create(track_id: var.id,student_id: user3.id)
StudentsTrack.create(track_id: var.id,student_id: user4.id)

#Resources: video, image, podcast, article, post
var.resources.create(title:"Amazing Video", description: "This video will teach you stuff!", content: "https://www.youtube.com/watch?v=Cg8sAM8E9ko", type_of: "Video")
var.resources.create(title:"Super awesome post", description: "This post will inform you about stuff.", content: "http://www.mathplanet.com/education/algebra-1/discovering-expressions,-equations-and-functions/expressions-and-variables", type_of: "Reading")
var.resources.create(title:"Coeffiecients", description: "Look at this image so that you know about variables well.", content: "https://www.mathsisfun.com/algebra/images/variable-constant.gif" , type_of: "Image")

exp_arr = [ {title:"Writing and Evaluating",
        description:"A Middle School Math tutorial on writing algebraic expressions, and evaluating them.",
        content:"https://www.youtube.com/watch?v=IWwR6pxq-IE",
        type_of:"Video"},

        {title:"Translating To Words",
        description:"Not sure of when to use parenthesis? Wondering what a switch word is? Perplexed by seeing the alphabet in math?",
        content:"https://www.youtube.com/watch?v=KmuWR_LriQU&nohtml5=False",
        type_of:"Video"},

        {title:"Translating English into Math Expressions",
        description:"A teacher better than I am will teach you this stuff.",
        content:"https://www.youtube.com/watch?v=zd1lwitGGco&nohtml5=False",
        type_of:"Video"},

        {title:"Steps to solving expressions",
        description:"These are the steps you should use to solve expressions",
        content:"http://www.algebra4children.com/worked_examples/Multiplication_algebraic%20_expressions2.jpg",
        type_of:"Image"},
]

exp_arr.each do |resource|
  exp.resources.create(resource)
  exp.save
end

slope_arr = [ {title:"Slope, Gradient, and Slope Intercept",
        description:"The slope or degree of slant of a line is defined as the degree of steepness or incline ...",
        content:"https://www.wyzant.com/resources/lessons/math/algebra/slope",
        type_of:"Reading"},

        {title:"Algebra Functions - Slope",
        description:"Know these formulas by heart.",
        content:"https://sites.google.com/a/pvlearners.net/slope/_/rsrc/1303334732367/resources/slope-form-algebra-student-nurses-1.1-800X800.jpg",
        type_of:"Image"},

        {title: "Find Slope and Rate of Change",
        description: "Cool vid.",
        content: "https://www.youtube.com/watch?v=yJVtt5zg9mk",
        type_of: "Video"},

        {title:"y = mx + b",
        description:"This cool guy will teach you how to solve the slope intercept form.",
        content:"https://www.youtube.com/watch?v=u3spOO-m_Gg&nohtml5=False",
        type_of:"Video"},
]

slope_arr.each do |resource|
  slope.resources.create(resource)
  slope.save
end

message_to_teacher= Message.create(sender_id: 1, recipient_id: 2, content: "HEYO IT BOBBO")
response_to_student= Message.create(sender_id: 2, recipient_id: 1, content: "Never say that again.")
