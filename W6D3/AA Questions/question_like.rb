class QuestionLike <ModeBase
  def self.liker_for_question_id(question_id)
    users_data = QuestionsDatabase.execute(<<-SQL, question_id: question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_likes
      ON
        users.id = question_likes.user_id
      WHERE
        question_likes.question_id= :question_id 
      SQL

      users_data.map { |user_data| User.new(user_data) }
  end
  
# Don't just use QuestionLike::likers_for_question_id and count; do a SQL query to just do this.
# This is more efficient, since the SQL DB will return just the number, and not the data for each of the likes.
  def self.num_likes_for_question_id(question_id)
    questions_data = QuestionsDatabase.execute(<<-SQL, question_id: question_id)
      SELECT 
        COUNT(*)
      FROM 
        questions
      JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      WHERE
        questions.id = question_id
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
      questions_data = QuestionsDatabase.execute(<<-SQL, user_id: user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      WHERE
        question_likes.user_id= :user_id 
      SQL
      questions_data.map { |question_data| Question.new(question_data) }
  end

  def self.most_liked_questions(n)
    questions_data = QuestionsDatabase.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY 
        COUNT(*) DESC
      Limit n
    SQL
    questions_data.map { |question_data| Question.new(question_data) }

  end


end