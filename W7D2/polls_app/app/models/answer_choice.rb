class AnswerChoice < ApplicationRecord
  validates :text, presence:true, uniqueness: true

  belongs_to :questions,
    primary_key: :id
    foreign_key: :question_id,
    class_name: 'Question'
end