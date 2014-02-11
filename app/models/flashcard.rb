class Flashcard < ActiveRecord::Base
	belongs_to :deck
	has_many :cardrelationships, foreign_key: "card_id", dependent: :destroy
	has_many :learners, through: :cardrelationships, source: :user
	validates :deck_id, presence: true
	validates :question, presence: true
	validates :answer, presence: true
end
