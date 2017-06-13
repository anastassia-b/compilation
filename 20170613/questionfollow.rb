
class QuestionFollow
  attr_accessor :user_id, :question_id

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless question_follow.length > 0

    QuestionFollow.new(question_follow.first)
  end

end
