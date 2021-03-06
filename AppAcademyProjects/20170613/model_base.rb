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

  def self.first
    data = QuestionsDatabase.get_first_row(<<-SQL)
      SELECT
        *
      FROM
        #{table}
      LIMIT
        1
    SQL

    self.new(data)
  end

  def self.where(params)
    if params.is_a?(Hash)
      where_line = params.keys.map { |key| "#{key} = ?" }.join(" AND ")
      vals = params.values
    else
      where_line = params
      vals = []
    end

    data = QuestionsDatabase.execute(<<-SQL, *vals)
      SELECT
        *
      FROM
        #{self.table}
      WHERE
        #{where_line}
    SQL

    parse_all(data)
  end

end
