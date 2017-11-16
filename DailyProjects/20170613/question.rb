require_relative 'questions_db'
require_relative 'model_base'

class Question < ModelBase
  attr_reader :id
  attr_accessor :title, :body, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = ?
    SQL

    question.nil? ? nil : Question.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.author_id = ?
    SQL

    question.nil? ? nil : question.map { |q| Question.new(q) }
  end

  def attrs
    { title: title, body: body, author_id: author_id }
  end

  def save
    if @id
      QuestionsDatabase.execute(<<-SQL, attrs.merge({ id: id }))
        UPDATE
          questions
        SET
          title = :title, body = :body, author_id = :author_id
        WHERE
          questions.id = :id
      SQL
    else
      QuestionsDatabase.execute(<<-SQL, attrs)
        INSERT INTO
          questions (title, body, author_id)
        VALUES
          (:title, :body, :author_id)
      SQL

      @id = QuestionsDatabase.last_insert_row_id
    end

    self
  end

  def author
    User.find_by_id(author_id)
  end
end
