class Deck < ActiveRecord::Base
	has_many :lessons
	has_many :flashcards
	has_many :questionnaires
	belongs_to :author, class_name: "User"
	has_many :deckrelationships, foreign_key: "followed_deck_id", dependent: :destroy
	has_many :followers, through: :deckrelationships, source: :follower

	validates :author_id, presence: true
	validates :title, presence: true, uniqueness: { case_sensitive: false }
	validates :language, presence: true, inclusion: { in: Conf.langs }
end
