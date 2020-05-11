require_relative 'model'
require_relative 'questions_database'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'user'
require_relative 'reply'

class Question < ModelBase
  attr_reader :id
  attr_accessor :title, :body, :author_id
  def initialize(options)
    @id         = options['id']
    @title      = options['title']
    @body       = options['body']
    @author_id  = options['author_id']
  end
  
  def save
    if @id
      QuestionDatabase.instance.execute(<<-SQL, @title, @body, @author_id,@id)
        UPDATE
          questions
        SET
          title = ?, body = ?, author_id = ?
        WHERE
          id =?
      SQL
    else 
      QuestionDatabase.execute(<<-SQL, @title, @body, @author_id)
        INSERT INTO 
          questions (title, body, author_id)
        VALUES
          (?, ?, ?)
      SQL
      @id = QuestionDatabase.last_insert_row_id
    end
    self
  end
  def self.find(id)
    question_data = QuestionDatabase.get_first_row(<<-SQL, id: id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = :id
    SQL
    Question.new(question_data)
  end

  #Queries
  #Each query method should return objects of the appropriate type. 
  #For instance, user.authored_questions should return an Array of Question objects.
  def self.find_by_author_id(author_id)
    questions_data = QuestionDatabase.execute(<<-SQL, author_id = author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.author_id = :author_id
    SQL

    questions_data.map{ |question_data| Question.new(question_data)}
  end

  def author
    User.find_by_id(author_id)
  end

  def followers(id)
    QuestionFollow.find_by_question_id(id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def num_likes(id)
    QuestionLike.num_likes_for_question_id(id)
  end

  def likers(id)
    QuestionLike.liker_for_question_id(id)
  end
  def most_liked(n)
    QuestionLike.most_liked_questions(n)
  end
end