class ModelBase
  def self.table
    self.to_s.tableize
  end

  def self.find_by_id(id)
    deta = QuestionsDatabase.get_first_row(<<-SQL, id:id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = :id
    SQL
    data.nil? ? nil : self.new(data)
  end


end