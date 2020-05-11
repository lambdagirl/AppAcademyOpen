require 'singleton'
require 'questions_database'
require 'model'

class Reply < ModelBase
  attr_reader :id
  attr_accessor :question_id, :parent_reply_id, :author_id, :body
  
  def initialize(options)
    @id               = options['id']
    @question_id      = options['question_id']
    @parent_reply_id  = options['parent_reply_id']
    @author_id        = options['author_id']
    @body             = options['body']
  end

  def save
    if @id
      QuestionsDatabase.execute(<<-SQL,  @question_id, @parent_reply_id, @author_id, @body, @id)
        UPDATE
          replies
        SET
          question_id = ?, parent_reply_id = ?, author_id = ?, body = ?
        WHERE
          id = ?
      SQL
    else
      QuestionsDatabase.execute(<<-SQL, @question_id, @parent_reply_id, @author_id, @body)
        INSERT INTO
          replies (question_id, parent_reply_id, author_id, body)
        VALUES
          (?,?,?,?)
      SQL
      @id = QuestionsDatabase.last_insert_row_id
    end
    self
  end
  def self.find(id)
    reply_data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.id = :id
    SQL

    Reply.new(reply_data)
  end

  def self.find_by_user_id(user_id)
    replies_data = QuestionsDatabase.execute(<<-SQL, user_id = user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.user_id =  :user_id
    SQL
    replies_data.map {|reply_data| Reply.new(reply_data)}
  end

  def self.find_by_question_id(question_id)
    replies_data = QuestionsDatabase.execute<<-SQL, question_id = question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.question_id = :question_id
    SQL
    replies_data.map{ |reply_data| Reply.new(reply_data)}
  end


  def self.find_by_parent_id(parent_id)
    replies_data = QuestionsDatabase.execute(<<-SQL, parent_reply_id: parent_id)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.parent_reply_id = :parent_reply_id
    SQL

    replies_data.map { |reply_data| Reply.new(reply_data) }
  end
  


  def author
    User.find_by_id(author_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find(parent_reply_id)
  end
  def child_replies
    Reply.find_by_parent_id(id)

  end
end