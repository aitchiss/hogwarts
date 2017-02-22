require ('pry')
require_relative ('./models/student.rb')
require_relative('./db/sql_runner.rb')
require_relative('./models/house.rb')

Student.delete_all
House.delete_all


griffindor = House.new({
  'name' => "Griffindor",
  'logo_url' => "http://vignette3.wikia.nocookie.net/harrypotter/images/9/96/Gryffindor_crest_by_tuliipiie-d491bqc.jpg/revision/latest/scale-to-width-down/394?cb=20130508231701"
  })

slytherin = House.new({
  'name' => "Slytherin",
  'logo_url' => "https://img.clipartfest.com/48dbabce9f3cfd1fa076ee0836f241e6_slytherin-logo-gallery-slytherin-logo-clipart_831-960.jpeg"
  })

ravenclaw = House.new({
  'name' => "Ravenclaw",
  'logo_url' => "http://harrypotter.wikia.com/wiki/File:Ravenclaw_Logo.jpg"
  })

hufflepuff = House.new({
  'name' => "Hufflepuff",
  'logo_url' => "https://sgt-pokemon.neocities.org/Harry_Potter/hufflepuffcrestlargewoshad.png"
  })

griffindor.save
slytherin.save
ravenclaw.save
hufflepuff.save

harry = Student.new(
{'first_name' => 'Harry', 'last_name' => 'Potter','house_id'=>griffindor.id, 'age' => 12}
)

hermione = Student.new(
{'first_name' => 'Hermione', 'last_name' => 'Granger','house_id'=>griffindor.id, 'age' => 11}
)

ron = Student.new(
{'first_name' => 'Ron', 'last_name' => 'Weasley','house_id'=>griffindor.id, 'age' => 12}
)

harry.save
hermione.save
ron.save 

binding.pry 
nil