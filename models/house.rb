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

end