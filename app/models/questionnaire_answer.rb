class QuestionnaireAnswer < ActiveRecord::Base
	belongs_to :questionnaire
	validates :question_id, presence: true
	validates :answer, presence: true
end
