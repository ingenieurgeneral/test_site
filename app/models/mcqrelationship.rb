class Mcqrelationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :questionnaire
	validates :user_id, presence: true
	validates :mcq_id, presence: true
end
