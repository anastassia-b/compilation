class Question
  attr_accessor :title, :body, :author

  def initialize(options)
    @title = options['title']
    @body = options['body']
    @author = options['author']
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end
end
