
class Reply
  attr_accessor :questions_id, :parent_reply, :user_id, :body

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
    @parent_reply = options['parent_reply']
    @body = options['body']
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

end
