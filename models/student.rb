require('pg')
require_relative('./../db/sql_runner.rb')

class Student
attr_accessor :first_name, :last_name, :age
attr_reader :id, :house_id


  def initialize(options)
    @id = options ['id'].to_i
    @first_name =options ['first_name']
    @last_name = options['last_name']
    @house_id = options ['house_id'].to_i
    @age = options['age'].to_i

      
  end

  def save
    sql ="INSERT INTO students (first_name, last_name,house_id,age) VALUES ('#{@first_name}', '#{@last_name}',#{@house_id}, #{@age}) RETURNING *;"
    result = SqlRunner.run(sql).first 
    @id = result['id'].to_i 
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id= #{id};"
    result = SqlRunner.run(sql).first
    return Student.new(result)
  end

  def self.all
    sql ="SELECT * FROM students;"
    students = Student.get_many(sql)
    return students
  end

  def self.get_many(sql)
    result = SqlRunner.run(sql)
    students = result.map {|student| Student.new(student)}
    return students
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
    
  end

  def house
    sql = "SELECT * FROM houses WHERE id = #{@house_id}"
    house = SqlRunner.run(sql).first 
    return House.new(house)

  end
end 