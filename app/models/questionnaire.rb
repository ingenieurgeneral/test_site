class Questionnaire < ActiveRecord::Base
	belongs_to :deck
	has_many :mcqrelationships, foreign_key: "mcq_id", dependent: :destroy
	has_many :learners, through: :mcqrelationships, source: :user
	has_many :questionnaire_answers
  accepts_nested_attributes_for :questionnaire_answers
  
	validates :deck_id, presence: true
	validates :question, presence: true
end
