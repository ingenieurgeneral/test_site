class Cardrelationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :lesson, foreign_key: "card_id"
	belongs_to :flashcard, foreign_key: "card_id"
	belongs_to :questionnaire, foreign_key: "card_id"
	validates :user_id, presence: true
	validates :card_id, presence: true
end
