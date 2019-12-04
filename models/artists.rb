require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :stage_name

  def initialize( options )
    @id = options['id'].to_i if options ['id']
    @stage_name = options['stage_name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      stage_name
    ) VALUES
    (
      $1
    )
    RETURNING id"
    values = [@stage_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    result = SqlRunner.run(sql)
  end


end
