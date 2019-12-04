require_relative('../db/sql_runner')
require_relative('./albums')

class Artist

  attr_reader :id
  attr_accessor :stage_name

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

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def update()
    sql = "
    UPDATE artists SET (
      stage_name
    ) =
    (
      $1
    ) WHERE id = $2"
    values = [@stage_name, @id]
    SqlRunner.run(sql, values)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map { |album| Album.new(album) }
    return albums
  end


end
