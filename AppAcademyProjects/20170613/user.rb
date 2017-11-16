require_relative 'questions_db'
require_relative 'model_base'

class User < ModelBase
  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def attrs
    { fname: fname, lname: lname }
  end

  def save
    if @id
      QuestionsDatabase.execute(<<-SQL, attrs.merge({ id: id }))
        UPDATE
          users
        SET
          fname = :fname, lname = :lname
        WHERE
          users.id = :id
      SQL
    else
      QuestionsDatabase.execute(<<-SQL, attrs)
        INSERT INTO
          users (fname, lname)
        VALUES
          (:fname, :lname)
      SQL

      @id = QuestionsDatabase.last_insert_row_id
    end
    self
  end

end
