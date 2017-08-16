require 'active_support/inflector'
require_relative 'questions_db'

class ModelBase
  def self.table
    self.to_s.tableize
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = :id
    SQL

    data.nil? ? nil : self.new(data)
  end

  def self.all
    data = QuestionsDatabase.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table}
    SQL

    parse_all(data)
  end

  def self.parse_all(data)
    data.map { |attrs| self.new(attrs) }
  end

end
