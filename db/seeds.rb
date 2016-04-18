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
teacher2 = Teacher.create(user_id: 4)
categories = ["STEM", "Health", "Music", "Language", "History", "Art"]

categories.each do |category|
  Category.create(title: category)
end

stem = Category.find_by(title: "STEM")
health = Category.find_by(title: "Health")
music = Category.find_by(title: "Music")
language = Category.find_by(title: "Language")
history = Category.find_by(title: "History")
art = Category.find_by(title: "Art")

algebra = stem.tracks.create(name: "Algebra", description: "Learn a lot of algebra!", teacher_id: 1, image_url: "http://2.bp.blogspot.com/-QHLYgEEiG2w/U2dbxVvh0eI/AAAAAAAAACA/8TeJWNsjbho/s1600/Algebra+The+Band+logo.png")
thai = health.tracks.create(name: "Thai Food", description: "Make the most amazing pad thai...", teacher_id: 1, image_url: "http://www.mintsdthai.com/resources/Pad%20Thai.jpg")
ukulele = music.tracks.create(name: "Ukulele", description: "Be that cool guy at that party.", teacher_id: 1, image_url: "http://www.ukuleletricks.com/wp-content/uploads/2011/12/kala-ka-t-tenor-ukulele.jpg")
english = language.tracks.create(name: "English 101", description: "Where art thou?", teacher_id: 1, image_url: "http://www.myenglishlanguage.com/wp-content/uploads/2012/01/english-language-guide.jpg")
ruby = stem.tracks.create(name: "Intro to Ruby", description: "Get your programming on!", teacher_id: 1, image_url: "http://4jo.amazingwp.com/wp-content/uploads/sites/16/2013/07/red-jewel-250.png")
train = stem.tracks.create(name: "How Trains Work", description: "Because you always wondered..", teacher_id: 2, image_url: "http://az616578.vo.msecnd.net/files/2016/02/27/6359219226453491021470707808_train.jpg")
g_and_s = music.tracks.create(name: "Appreciating Operrettas: Gilbert and Sullivan", teacher_id: 2, description: "You'll soon be able to whistle all the airs from that infenral non-sense, Pinafore!", image_url: "http://g-and-s.org/sullivan_gilbert.jpg")
jazz = music.tracks.create(name: "History of Jazz", description: "Get hip on jazz!", teacher_id: 2, image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0e/Louis_Armstrong_restored.jpg")
ancientEgypt = history.tracks.create(name: "Ancient Egypt", description: "Understanding the Ancient Civilization", teacher_id: 2, image_url: "http://schools.academytravel.com.au/media/Image/cache/Cc730385-Ancient_Egypt_OneLine_Itineraries_AI_Egypt.jpg")
pollock = art.tracks.create(name: "Jackson Pollock", description: "Art Visionary", teacher_id: 2, image_url: "https://meappropriatestyle.files.wordpress.com/2014/04/pollack-autumn-image-ex-all-over-artdiscovery-info1.jpg")

arr_track = [algebra, thai, ukulele, english, ruby, train, g_and_s, jazz, ancientEgypt, pollock]


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

#jeff's seed data -----------------------------------------------------#
pad = thai.lessons.create(title: "Main Courses", duration: "20 minutes", order_id: 1)
app = thai.lessons.create(title: "Appetizers", duration: "10 minutes", order_id: 2)
dess = thai.lessons.create(title: "Desserts", duration: "20 minutes", order_id: 3)

pad_arr = [ {title:"Shrimp Pad Thai",
        description:"Shrimp Pad Thai – easiest and best Pad Thai recipe with shrimp. This homemade Thai fried noodle is better and healthier than takeout.",
        content:"http://rasamalaysia.com/shrimp-pad-thai-recipe/",
        type_of:"Reading"},

        {title:"Thai Beef Salad",
        description:"Tender greens with perfectly seared beef in a savory Thai dressing that is packed with lots of flavor.",
        content:"http://rasamalaysia.com/thai-beef-salad-recipe/",
        type_of:"Reading"},

        {title:"Thai Food Cooking Tutorial: Pad Thai",
        description:"The world's most famous and favorite Thai food is here, Pad Thai! I made this video easy to follow for everyone to learn.",
        content:"https://www.youtube.com/watch?v=jwudCMCd9ek",
        type_of:"Video"},

        {title:"How To Make Thai Green Chicken Curry",
        description:"These are the steps you should use to solve expressions",
        content:"https://www.youtube.com/watch?v=FaBbrYq-jaw",
        type_of:"Video"},
]

pad_arr.each do |resource|
  pad.resources.create(resource)
  pad.save
end


app_arr = [ {title:"Thai Appetizer - Curry Puff Binding",
        description:"This menu is received influence from the foreigners. Because the dough is similar to pie dough. There are varieties kind of filling such as salty and sweet filling.",
        content:"https://www.youtube.com/watch?v=icmRYXUQNeU",
        type_of:"Video"},

        {title:"Thai Appetizer",
        description:"This dish is very delicious, simple to make ,Perfect snack while watching TV or for party.",
        content:"https://www.youtube.com/watch?v=_MjMI4Sjm3Y",
        type_of:"Video"},

        {title:"How to Make Thai Appetizer Pizza",
        description:"Deliciously bold Asian flavors star in a make-ahead appetizer pizza.",
        content:"https://www.youtube.com/watch?v=rOjDMbmhy10",
        type_of:"Video"},

        {title:"Tapioca Balls with Pork Filling",
        description:"Tapioca Balls with Pork Filling is a delicious Thai traditional appetizer menu, with chewy sago",
        content:"https://www.youtube.com/watch?v=e8pVJqX4P3I",
        type_of:"Video"},
]

app_arr.each do |resource|
  app.resources.create(resource)
  app.save
end


#------------------------------------------------------------------------#

message_to_teacher= Message.create(sender_id: 1, recipient_id: 2, content: "HEYO IT BOBBO")
response_to_student= Message.create(sender_id: 2, recipient_id: 1, content: "Never say that again.")

#josh's seed data -----------------------------------------------------#
#jazz
theBeginnings = jazz.lessons.create(title: "The Beginnings of Jazz", duration: "40 minutes", order_id: 1)
bebop = jazz.lessons.create(title: "Bebop: The changing sound", duration: "120 minutes", order_id: 2)
milesDavis = jazz.lessons.create(title: "Miles Davis", duration: "100 minutes", order_id: 3)

theBeginnings_arr = [ {title:"Jazz Timeline",
        description:"Follow this timeline to understand when and where Jazz was happening",
        content:"http://www.jazzinamerica.org/jazzresources/timeline",
        type_of:"Reading"},

        {title:"The Changing Sound",
        description:"A review of the various types of sounds that comprise jazz.",
        content:"http://teacher.scholastic.com/activities/bhistory/history_of_jazz.htm",
        type_of:"Reading"},

        {title:"Blulight Films present a History of Jazz",
        description:"The big stars of jazz music in a film memorable!",
        content:"https://www.youtube.com/watch?v=86wy824lpM0",
        type_of:"Video"},

        {title:"The Jazz Age Documentary",
        description:"The JAZZ AGE captures America as it went through profound and exhilarating change in morals and manners from the end of world war I to the great crash of 1929.",
        content:"https://www.youtube.com/watch?v=_cbWqfAd390",
        type_of:"Video"},
]

theBeginnings_arr.each do |resource|
  theBeginnings.resources.create(resource)
  theBeginnings.save
end

bebop_arr = [ {title:"Bebop Roots and Renaissance",
        description:"The first major innovation that destabilized the world order introduced by swing was bebop.",
        content:"http://www.scaruffi.com/history/jazz8.html",
        type_of:"Reading"},

        {title:"How Bebop Came to Be",
        description:"Bebop, despite its rather short lifespan, would become a key influence for every style that
came after it.",
        content:"http://cupola.gettysburg.edu/cgi/viewcontent.cgi?article=1263&context=student_scholarship",
        type_of:"Reading"},

        {title:"What is Jazz, Bebop and Improvisation?",
        description:"Dr. Billy Taylor and Vincent Herring discuss Jazz, improvisation and Bebop",
        content:"https://www.youtube.com/watch?v=Shy0l6aTWWQ",
        type_of:"Video"}
]

bebop_arr.each do |resource|
  bebop.resources.create(resource)
  bebop.save
end

milesDavis_arr = [ {title:"Kids Music Corner: Miles Davis",
        description:"An introduction to Miles Davis aimed at kids",
        content:"http://kidsmusiccorner.co.uk/composers/jazz/miles-davis/",
        type_of:"Reading"},

        {title:"In his own words",
        description:"MilesDavis.com does an in-depth look on Miles.",
        content:"https://www.milesdavis.com/biography/",
        type_of:"Reading"},

        {title:"Birth of the Cool",
        description:"The complete Birth of the Cool album for you to listen to.",
        content:"https://www.youtube.com/watch?v=v8kjOpfMBbM",
        type_of:"Video"},

        {title:"Kind of Blue",
        description:"The complete album of the acclaimed Jazz album",
        content:"https://www.youtube.com/watch?v=kbxtYqA6ypM",
        type_of:"Video"},

        {title:"Live in 1964",
        description:"See a rare vintage performance of the Miles Davis Quintet in 1964",
        content:"https://www.youtube.com/watch?v=kJq3j4rA0o0",
        type_of:"Video"}
]

milesDavis_arr.each do |resource|
  milesDavis.resources.create(resource)
  milesDavis.save
end

#Egypt
earlyHistory = ancientEgypt.lessons.create(title: "Early History", duration: "40 minutes", order_id: 1)
theHyksos = ancientEgypt.lessons.create(title: "The Hyksos", duration: "60 minutes", order_id: 2)
newkingdom = ancientEgypt.lessons.create(title: "The New Kingdom", duration: "40 minutes", order_id: 3)

earlyHistory_arr = [ {title:"Intro to Early History of Egypt",
        description:"A high level review of the early history of Egypt",
        content:"http://www.historyworld.net/wrldhis/PlainTextHistories.asp?ParagraphID=aqe",
        type_of:"Reading"},

        {title:"Pre-Dynastic Period",
        description:"The Predynastic Period of Ancient Egypt (prior to 3100 BC) is traditionally the period between the Early Neolithic and the beginning of the Pharaonic monarchy starting with King Narmer.",
        content:"http://www.cemml.colostate.edu/cultural/09476/egypt02-02enl.html",
        type_of:"Reading"},

        {title:"Documentary on Ancient Egypt",
        description:"Ancient Egypt Documentary - Complete History - 8000 B.C. to 30 B.C. Part 1",
        content:"https://www.youtube.com/watch?v=KuUMe-43A3E",
        type_of:"Video"},

        {title:"Secrets of the Pyramids",
        description:"A different take on the purpose, design and significance of the pyramids in Egypt. ",
        content:"https://www.youtube.com/watch?v=rcKahraBiBY",
        type_of:"Video"},
]

earlyHistory_arr.each do |resource|
  earlyHistory.resources.create(resource)
  earlyHistory.save
end

theHyksos_arr = [ {title:"Hyksos in Egypt",
        description:"This video consists of scenes from the documentary entitled 'Egypts Golden Empire - Series 1 - Ep 1' and other clips concerning the fall of Avaris in ancient Egypt",
        content:"https://www.youtube.com/watch?v=rZZXOztBiUc",
        type_of:"Video"},

        {title:"Hyksos - Further Readings",
        description:"Ancient Egypt online reveals who the Hyksos were.",
        content:"http://www.ancientegyptonline.co.uk/hyksos.html",
        type_of:"Reading"},

        {title:"Forgotten Empires",
        description:"A deep look into ancient empires",
        content:"https://www.youtube.com/watch?v=5hBX0yRaJ5w",
        type_of:"Video"}
]

theHyksos_arr.each do |resource|
  theHyksos.resources.create(resource)
  theHyksos.save
end

newkingdom_arr = [ {title:"Extensive Review of the New Kingdom of Ancient Egypt",
        description:"The exhaustive wikipedia article is essential reading",
        content:"https://en.wikipedia.org/wiki/New_Kingdom_of_Egypt",
        type_of:"Reading"},

        {title:"The Met: New Kingdom",
        description:"Late in the Second Intermediate Period (ca. 1640–1550 B.C.), the Theban rulers (Dynasty 17) began to drive the Hyksos kings (Dynasty 15) from the Delta.",
        content:"http://www.metmuseum.org/toah/hd/nking/hd_nking.htm",
        type_of:"Reading"},

        {title:"New Kingdom History",
        description:"An in-depth documentary produced by PBS.",
        content:"https://www.youtube.com/watch?v=petQs5yl3dk",
        type_of:"Video"}
]

newkingdom_arr.each do |resource|
  newkingdom.resources.create(resource)
  newkingdom.save
end

#Jackson Pollock
influences = pollock.lessons.create(title: "Influences", duration: "40 minutes", order_id: 1)
work = pollock.lessons.create(title: "The Work", duration: "120 minutes", order_id: 2)
abstractExpressionism = pollock.lessons.create(title: "Abstract Expressionism", duration: "100 minutes", order_id: 3)

influences_arr = [ {title:"A brief biography",
        description:"Understanding an artist's background is critical to understanding an artist",
        content:"http://www.jackson-pollock.org/",
        type_of:"Reading"},

        {title:"A brief overview of his early years",
        description:"Jackson Pollock is one of the most famous painters of contemporary world of arts who is often regarded as one of the pioneers of modern art.",
        content:"http://www.thefamouspeople.com/profiles/paul-jackson-pollock-1718.php",
        type_of:"Reading"},

        {title:"Mini Bio: Jackson Pollock",
        description:"Famous for his drip paintings, Jackson Pollock was born on January 28, 1912. ",
        content:"https://www.youtube.com/watch?v=TCEgtPAhtuo",
        type_of:"Video"},
]

influences_arr.each do |resource|
  influences.resources.create(resource)
  influences.save
end

work_arr = [ {title:"Drip",
        description:"Review of Pollock's unique style",
        content:"http://www.wikiart.org/en/jackson-pollock",
        type_of:"Reading"},

        {title:"Pollock",
        description:"Critical review of Pollock's most important work.",
        content:"https://www.youtube.com/watch?v=JZ3glUYHa3Q",
        type_of:"Video"},

        {title:"Jackson Pollock 51",
        description:"Watch the artist at work.",
        content:"https://www.youtube.com/watch?v=CrVE-WQBcYQ",
        type_of:"Video"}
]

work_arr.each do |resource|
  work.resources.create(resource)
  work.save
end

abstractExpressionism_arr = [ {title:"Abstract Expressionism",
        description:"Review where it came from and why it started",
        content:"http://www.theartstory.org/movement-abstract-expressionism.htm",
        type_of:"Reading"},

        {title:"Khan Academy: Abstract Expressionism",
        description:"The group of artists known as Abstract Expressionists emerged in the US following World War II. As the term suggests, their work was characterized by non-objective imagery that appeared emotionally charged with personal meaning. ",
        content:"https://www.khanacademy.org/humanities/art-1010/abstract-exp-nyschool/abstract-expressionism/a/abstract-expressionism-an-introduction",
        type_of:"Reading"},

        {title:"Lecture on Abstract Expressionism",
        description:"This video lecture on Abstract Expressionism was created for my Modern Literature & the Arts class.",
        content:"https://www.youtube.com/watch?v=mHpK195OAK8",
        type_of:"Video"},

        {title:"The revolutionary techniques in Abstract expressionism",
        description:"Breaking boundries and Jackson Pollock's influence on the movement.",
        content:"https://www.youtube.com/watch?v=tukWl5CCJLU",
        type_of:"Video"}

]

abstractExpressionism_arr.each do |resource|
  abstractExpressionism.resources.create(resource)
  abstractExpressionism.save
end
