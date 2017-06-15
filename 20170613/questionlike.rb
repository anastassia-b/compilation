require_relative 'questions'

class QuestionLike
  attr_accessor :user_id, :question_id

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless question_like.length > 0

    QuestionLike.new(question_like.first)
  end
end
