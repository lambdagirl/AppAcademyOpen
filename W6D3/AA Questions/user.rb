require_relative 'model'
require_relative 'questions_database'

class User < ModelBase

  def self.find_by_name(fname, lname)
    user_data = QuestionDatabase.get_first_row(<<-SQL, @fname: fname, @lname: lname)
      SELECT
        *
      FROM
       users
      WHERE users.fname = :fname AND user.lname = :lname
    SQL
    user_data.nil? ? nil : User.new(user_data)
  end
  def self.find_by_id(id)
    user_data = QuestionsDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        users.*
      FROM
        users
      WHERE
        users.id = :id
    SQL

    user_data.nil? ? nil : User.new(user_data)
  end

  attr_reader :id
  attr_accessor :fname, :lname
  def initialize(options)
    @id     = options['id']
    @fname  = options['fname']
    @lname  = options['lname']
  end

  def save
    if @id
      QuestionDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET 
          fname = ?, lname = ?
        WHERE
          id = ?
      SQL
    else
      QuestionDatabase.execute(<<-SQL, @fname,@lname)
        INSERT INTO
          users (fname,lname)
        VALUES
          (?, ?, ?)
      SQL
      @id = QuestionDatabase.last_insert_row_id
    end
    self
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end
  
  def followed_questions(id)
    #One-liner calling QuestionFollow method.
    QuestionFollow.followed_questions_for_user_id(id)
  end

  def liked_questions(id)
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma(id)
    QuestionsDatabase.get_first_value(<<-SQL, author_id: self.id)
      SELECT
        CAST(COUNT(question_likes.id)AS FLOAT) / 
          COUNT(DISTINCT(queations.id) AS avg_karma)
      FROM
        questions
      LEFT OUTER JOIN
        question_likes
      ON 
        questions.id = question_likes.question_id
      WHERE
        questions.author_id = :author_id
    SQL
end