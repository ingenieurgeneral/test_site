class Cardrelationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :lesson
	belongs_to :flashcard
	belongs_to :questionnaire
	validates :user_id, presence: true
	validates :card_id, presence: true
end
