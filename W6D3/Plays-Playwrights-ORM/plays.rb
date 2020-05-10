require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    #instance 
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    # array of hashes => columns
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year,@playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
        VALUES
        (?, ?, ?)
    SQL
    #(?,?,?)SQL injection attacks
    #playwright_id == "3; DROP TABLE plays"
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not exist in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id,@id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id =?
    SQL
  end
end