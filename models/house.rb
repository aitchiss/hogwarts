class House

  attr_accessor :name, :logo_url
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo_url = options['logo_url']
  end

  def save
    sql = "INSERT INTO houses (name, logo_url) VALUES ('#{@name}', '#{@logo_url}') RETURNING * ;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i

  end

  def self.all
    sql = "SELECT * FROM houses"
    result = House.get_many(sql)
    return result 
    
  end

  def self.get_many(sql)
    result = SqlRunner.run(sql)
    houses = result.map {|house| House.new(house)}
    return houses
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    return House.new(result)
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end
end