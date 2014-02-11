class Flashcardrelationship < ActiveRecord::Base
	belongs_to :user
	belongs_to :flashcard
	validates :user_id, presence: true
	validates :flashcard_id, presence: true
end
