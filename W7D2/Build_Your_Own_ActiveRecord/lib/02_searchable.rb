require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    params = params.map {|col,val| "#{col}='#{val}'"}.join(" AND\n")
    results = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{table_name}
      WHERE #{params}
    SQL

    parse_all(results)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
