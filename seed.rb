require ('pry')
require_relative ('./models/student.rb')
require_relative('./db/sql_runner.rb')

harry = Student.new(
{'first_name' => 'Harry', 'last_name' => 'Potter','house'=>'Griffindor', 'age' => 12}
)

hermione = Student.new(
{'first_name' => 'Hermione', 'last_name' => 'Granger','house'=>'Griffindor', 'age' => 11}
)

ron = Student.new(
{'first_name' => 'Ron', 'last_name' => 'Weasley','house'=>'Griffindor', 'age' => 12}
)

harry.save
hermione.save
ron.save 

binding.pry 
nil