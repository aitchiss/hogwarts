require('pg')
require_relative('./../db/sql_runner.rb')

class Student
attr_accessor :first_name, :last_name, :age, :house
attr_reader :id


  def initialize(options)
    @id = options ['id'].to_i
    @first_name =options ['first_name']
    @last_name = options['last_name']
    @house = options ['house']
    @age = options['age'].to_i
      
  end

  def save
    sql ="INSERT INTO students (first_name, last_name,house,age) VALUES ('#{@first_name}', '#{@last_name}','#{@house}', #{@age}) RETURNING *;"
    result = SqlRunner.run(sql).first 
    @id = result['id'].to_i 
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
    
  end

end 